import 'package:control_do_dinheiro/app/cubits/cadastro_de_usuario/cadastro_de_usuario_cubit.dart';
import 'package:control_do_dinheiro/app/pages/cadastro_de_usuario/cadastro_de_usuario_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          PrimaryButton(title: 'Entrar', onPressed: () {}),
          SizedBox(height: size.height * .01),
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
