import 'package:control_do_dinheiro/app/cubits/cadastro_de_usuario/cadastro_de_usuario_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CadastroDeTrabalhadoresCubit extends Cubit<EstadoDeForulario> {
  TextEditingController biController;
  TextEditingController nomeController;
  TextEditingController moradaController;
  TextEditingController salarioController;
  DateTime dateTime;
  BuildContext context;

  CadastroDeTrabalhadoresCubit(this.context) : super(EstadoDeForulario.inicial) {
    nomeController = TextEditingController();
    biController = TextEditingController();
    moradaController = TextEditingController();
    salarioController = TextEditingController();
  }

  String get nome => nomeController.text;
  String get bi => biController.text;
  String get morada => moradaController.text;
  String get data => dateTime.toString().substring(0, 12 - 1);

  cancelar() {
    Navigator.pop(context);
  }
}
