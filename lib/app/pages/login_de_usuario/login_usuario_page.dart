import 'package:control_do_dinheiro/app/cubits/cadastro_de_usuario/cadastro_de_usuario_cubit.dart';
import 'package:control_do_dinheiro/app/cubits/login_de_usuario/login_de_usuario_cubit.dart';
import 'package:control_do_dinheiro/app/pages/cadastro_de_usuario/cadastro_de_usuario_page.dart';
import 'package:control_do_dinheiro/core/modules/usecases/leitor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'componenetes/default_view.dart';
import 'componenetes/logo.dart';
import 'componenetes/primary_button.dart';
import 'componenetes/senha_enter_text.dart';
import 'componenetes/tela_de_carregamento.dart';
import 'componenetes/usuario_enter_text.dart';

class LoginUsuarioPage extends StatefulWidget {
  @override
  _LoginUsuarioPageState createState() => _LoginUsuarioPageState();
}

class _LoginUsuarioPageState extends State<LoginUsuarioPage> {
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _controller = BlocProvider.of<LoginDeUsuarioCubit>(context);
    return Scaffold(
      body: BlocBuilder<LoginDeUsuarioCubit, EstadoDoCadastro>(
        cubit: BlocProvider.of(context),
        builder: (context, state) {
          switch (state) {
            case EstadoDoCadastro.inicial:
              return DefaultView(
                controller: _controller,
                usuarioTextController: _controller.usuarioTextController,
                senhaTextController: _controller.senhaTextController,
              );
              break;
            case EstadoDoCadastro.carregando:
              return TelaDeCarregamento();
              break;
            default:
              return Container(
                child: Center(
                  child: Text('Erro'),
                ),
              );
          }
        },
      ),
    );
  }
}
