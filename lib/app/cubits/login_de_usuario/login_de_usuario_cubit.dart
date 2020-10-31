import 'package:control_do_dinheiro/app/cubits/cadastro_de_usuario/cadastro_de_usuario_cubit.dart';
import 'package:control_do_dinheiro/app/pages/home_page/telas/resgistros_screen.dart';
import 'package:control_do_dinheiro/core/modules/usecases/leitor.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginDeUsuarioCubit extends Cubit<EstadoDeForulario> {
  BuildContext context;
  TextEditingController usuarioTextController;
  TextEditingController senhaTextController;

  LoginDeUsuarioCubit(this.context) : super(EstadoDeForulario.inicial) {
    usuarioTextController = TextEditingController();
    senhaTextController = TextEditingController();
  }

  String get userName => usuarioTextController.text;
  String get senha => senhaTextController.text;

  entrar() async {
    emit(EstadoDeForulario.carregando);
    await Future.delayed(Duration(seconds: 2));
    var result = await login(userName, senha);
    if (result is Right) {
      Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            transitionDuration: Duration(milliseconds: 500),
            pageBuilder: (context, animation, secondaryAnimation) {
              return RegistroScreen();
            },
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
          ));
    } else {
      emit(EstadoDeForulario.erro);
    }
  }
}
