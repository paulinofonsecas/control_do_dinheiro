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
                      onPressed: () async {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder:
                                (context, animation, secondaryAnimation) {
                              return TelaDeCarregamento();
                            },
                          ),
                        );
                        await Future.delayed(Duration(seconds: 4));
                        Navigator.pop(context);
                      }),
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
    );
  }

  Widget _buildLogo(String title, Size size, [TextStyle style]) {
    return BuildLogo(
      title: title,
      style: style,
    );
  }
}

class BuildLogo extends StatelessWidget {
  const BuildLogo({
    Key key,
    @required this.title,
    this.style,
  }) : super(key: key);

  final String title;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * .40,
      child: Align(
        child: Text(
          title,
          style: style ??
              TextStyle(
                color: Colors.white,
                fontSize: size.height * .08,
              ),
        ),
      ),
    );
  }
}

class TelaDeCarregamento extends StatefulWidget {
  const TelaDeCarregamento({
    Key key,
  }) : super(key: key);

  @override
  _TelaDeCarregamentoState createState() => _TelaDeCarregamentoState();
}

class _TelaDeCarregamentoState extends State<TelaDeCarregamento>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    _controller.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xff282936),
      body: Container(
        child: Column(
          children: [
            BuildLogo(
              title: 'Entrando...',
              style: TextStyle(
                color: Colors.white,
                fontSize: size.height * .05,
              ),
            ),
            AnimatedBuilder(
              animation: _controller,
              builder: (context, animation) {
                return ScaleTransition(
                  alignment: Alignment.center,
                  scale: _controller.drive(
                    Tween(begin: 3, end: 1),
                  ),
                  child: Hero(
                    tag: 'progress',
                    child: Container(
                      width: 60,
                      height: 60,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(90),
                      ),
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.white,
                      ),
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
