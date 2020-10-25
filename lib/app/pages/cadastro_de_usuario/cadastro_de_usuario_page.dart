import 'package:control_do_dinheiro/app/pages/login_de_usuario/componenetes/primary_button.dart';
import 'package:control_do_dinheiro/app/pages/login_de_usuario/componenetes/senha_enter_text.dart';
import 'package:control_do_dinheiro/app/pages/login_de_usuario/componenetes/usuario_enter_text.dart';
import 'package:flutter/material.dart';

class CadastroDeUsuarioPage extends StatefulWidget {
  @override
  _CadastroDeUsuarioPageState createState() => _CadastroDeUsuarioPageState();
}

class _CadastroDeUsuarioPageState extends State<CadastroDeUsuarioPage> {
  TextEditingController nomeCompletoController;
  TextEditingController biController;
  TextEditingController senhaController;
  TextEditingController confirmaSenhaController;

  @override
  void initState() {
    nomeCompletoController = TextEditingController();
    biController = TextEditingController();
    senhaController = TextEditingController();
    confirmaSenhaController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xff282936),
      body: Column(
        children: [
          SizedBox(height: size.height * .05),
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(90),
            ),
            child: Center(
              child: Icon(
                Icons.camera,
                size: 90,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(height: 40),
          PrimaryEnterText(
            controller: nomeCompletoController,
            title: 'Nome completo',
          ),
          SizedBox(height: 15),
          PrimaryEnterText(
            controller: biController,
            title: 'Bilhete de identidade',
          ),
          SizedBox(height: 15),
          SenhaEnterText(
            senhaTextController: senhaController,
            title: 'Palavra-passe',
          ),
          SizedBox(height: 15),
          SenhaEnterText(
            senhaTextController: confirmaSenhaController,
            title: 'Confirmar Palavra-passe',
          ),
          SizedBox(height: 25),
          PrimaryButton(title: 'Cadastrar', onPressed: () {}),
          SizedBox(height: 10),
          PrimaryButton(
            title: 'Cancelar',
            onPressed: () {
              Navigator.pop(context);
            },
            color: Colors.red,
          ),
        ],
      ),
    );
  }
}

class CustomLogo extends StatelessWidget {
  const CustomLogo({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Cadastro de usuario',
          style: TextStyle(
            color: Colors.white,
            fontSize: size.width * .04,
          ),
        ),
      ],
    );
  }
}
