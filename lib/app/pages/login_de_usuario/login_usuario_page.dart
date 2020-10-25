import 'package:flutter/material.dart';

import 'componenetes/primary_button.dart';
import 'componenetes/senha_enter_text.dart';
import 'componenetes/usuario_enter_text.dart';

class LoginUsuarioPage extends StatefulWidget {
  @override
  _LoginUsuarioPageState createState() => _LoginUsuarioPageState();
}

class _LoginUsuarioPageState extends State<LoginUsuarioPage> {
  TextEditingController usuarioTextController;
  TextEditingController senhaTextController;

  @override
  initState() {
    usuarioTextController = TextEditingController();
    senhaTextController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xff282936),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _buildLogo(size),
          UsuarioEnterText(usuarioTextController: usuarioTextController),
          SenhaEnterText(senhaTextController: senhaTextController),
          SizedBox(height: size.height * .08),
          PrimaryButton(title: 'Entrar'),
          SizedBox(height: size.height * .01),
          PrimaryButton(title: 'Criar conta', color: Colors.green),
        ],
      ),
    );
  }

  SizedBox _buildLogo(Size size) {
    return SizedBox(
      height: size.height * .40,
      child: Align(
        child: Text(
          'Bem-vindo',
          style: TextStyle(
            color: Colors.white,
            fontSize: size.height * .08,
          ),
        ),
      ),
    );
  }
}
