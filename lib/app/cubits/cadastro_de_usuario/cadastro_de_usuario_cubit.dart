import 'package:control_do_dinheiro/app/componenets/custom_dialog.dart';
import 'package:control_do_dinheiro/core/modules/entitys/usuario.dart';
import 'package:control_do_dinheiro/core/modules/usecases/cadastro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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

  void sair() {
    Navigator.pop(context);
  }

  void cancelar() async {
    var mensagem = 'Desejá sair do cadastro?';
    Function secundary;
    Function primary;

    await showDialog(
      context: context,
      builder: (context) {
        return CustomDialog(
          mensagem: mensagem,
          secundary: secundary,
          primary: primary,
        );
      },
    );
  }

  verificarOsDados() {
    verificarNulabilidadeDosDados() {
      var result =
          nome != null && user != null && senha != null && confSenha != null;
      if (result) {
        return;
      } else {
        anunciarErro();
      }
    }

    verificarIgualDadeDasSenhas() {
      var result = senha == confSenha;
      if (result)
        return;
      else
        anunciarErro();
    }

    verificarNulabilidadeDosDados();
    verificarIgualDadeDasSenhas();
  }

  void cadastrar() async {
    verificarOsDados();
    var usuarioACadastrar = Usuario(nome: nome, userName: user, senha: senha);
    emit(EstadoDoCadastro.carregando);
    var result = await Cadastrar.usuario().cadastrarUsuario(usuarioACadastrar);
    var estado = result | false;
    if (estado) {
      await showDialog(
        context: context,
        builder: (context) {
          return Mensagem();
        },
      );
      sair();
    } else {}
  }

  anunciarErro() {}
}

class Mensagem extends StatelessWidget {
  const Mensagem({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          Icons.verified,
          size: 120,
          color: Colors.green,
        ),
        Text(
          'Cadastro conluído',
          style: TextStyle(
            color: Colors.black,
            fontSize: 22,
          ),
        )
      ],
    );
  }
}

enum EstadoDoCadastro {
  inicial,
  carregando,
  finalizado,
  erro,
}
