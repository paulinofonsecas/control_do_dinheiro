import 'package:control_do_dinheiro/app/cubits/cadastro_de_usuario/cadastro_de_usuario_cubit.dart';
import 'package:control_do_dinheiro/app/cubits/login_de_usuario/login_de_usuario_cubit.dart';
import 'package:control_do_dinheiro/app/pages/cadastro_de_usuario/cadastro_de_usuario_page.dart';
import 'package:control_do_dinheiro/app/pages/login_de_usuario/componenetes/primary_button.dart';
import 'package:control_do_dinheiro/app/pages/login_de_usuario/componenetes/senha_enter_text.dart';
import 'package:control_do_dinheiro/app/pages/login_de_usuario/componenetes/usuario_enter_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'logo.dart';

class DefaultView extends StatelessWidget {
  const DefaultView({
    Key key,
    @required this.controller,
    @required this.usuarioTextController,
    @required this.senhaTextController,
  }) : super(key: key);

  Widget _buildLogo(String title, Size size, [TextStyle style]) {
    return Logo(
      title: title,
      style: style,
    );
  }

  final LoginDeUsuarioCubit controller;
  final TextEditingController usuarioTextController;
  final TextEditingController senhaTextController;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xff282936),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              children: [
                Hero(tag: 'titlo', child: _buildLogo('Bem-vindo', size)),
                PrimaryEnterText(
                  controller: usuarioTextController,
                  title: 'Nome do usuario',
                ),
                SizedBox(height: size.height * .02),
                SenhaEnterText(
                  senhaTextController: senhaTextController,
                  title: 'Palavra-passe',
                ),
                SizedBox(height: size.height * .08),
                Material(
                  color: Colors.transparent,
                  child: Hero(
                    tag: 'progressa',
                    child: PrimaryButton(
                      title: 'Entrar',
                      onPressed: controller.entrar,
                    ),
                  ),
                ),
                SizedBox(height: size.height * .01),
              ],
            ),
            PrimaryButton(
              title: 'Criar conta',
              color: Colors.green,
              onPressed: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (_) => BlocProvider(
                      create: (_) => CadastroDeUsuarioCubit(context),
                      child: CadastroDeUsuarioPage(),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
