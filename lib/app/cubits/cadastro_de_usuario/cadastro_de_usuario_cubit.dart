import 'package:control_do_dinheiro/core/modules/entitys/usuario.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CadastroDeUsuarioCubit extends Cubit<EstadoDoCadastro> {
  BuildContext context;
  TextEditingController nomeCompletoController;
  TextEditingController userName;
  TextEditingController senhaController;
  TextEditingController confirmaSenhaController;

  CadastroDeUsuarioCubit(this.context) : super(EstadoDoCadastro.inicial) {
    nomeCompletoController = TextEditingController();
    userName = TextEditingController();
    senhaController = TextEditingController();
    confirmaSenhaController = TextEditingController();
  }

  String get nome => nomeCompletoController.text;
  String get user => userName.text;
  String get senha => senhaController.text;
  String get confSenha => confirmaSenhaController.text;

  void cancelar() {
    Navigator.pop(context);
  }

  void cadastrar() {
    if (senha == confSenha) {
      var usuarioPorCadastrar = Usuario(
        nome: nome,
        userName: user,
        senha: senha,
      );
      
    }
  }
}

enum EstadoDoCadastro {
  inicial,
  carregando,
  finalizado,
  erro,
}
