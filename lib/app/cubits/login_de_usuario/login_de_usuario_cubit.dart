import 'package:control_do_dinheiro/app/cubits/cadastro_de_usuario/cadastro_de_usuario_cubit.dart';
import 'package:control_do_dinheiro/core/modules/usecases/leitor.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginDeUsuarioCubit extends Cubit<EstadoDoCadastro> {
  BuildContext context;
  TextEditingController usuarioTextController;
  TextEditingController senhaTextController;

  LoginDeUsuarioCubit(this.context) : super(EstadoDoCadastro.inicial) {
    usuarioTextController = TextEditingController();
    senhaTextController = TextEditingController();
  }

  String get userName => usuarioTextController.text;
  String get senha => senhaTextController.text;

  entrar() async {
    emit(EstadoDoCadastro.carregando);
    await Future.delayed(Duration(seconds: 2));
    var result = await login(userName, senha);
    if (result is Right) {
      Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) {
              return Container(
                color: Colors.white,
              );
            },
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return ScaleTransition(
                scale: animation,
                child: child,
              );
            },
          ));
    } else {
      emit(EstadoDoCadastro.erro);
    }
  }
}
