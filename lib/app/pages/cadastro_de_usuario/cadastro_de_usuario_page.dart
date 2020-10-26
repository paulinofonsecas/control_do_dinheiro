import 'package:control_do_dinheiro/app/cubits/cadastro_de_usuario/cadastro_de_usuario_cubit.dart';
import 'package:control_do_dinheiro/app/pages/login_de_usuario/componenetes/primary_button.dart';
import 'package:control_do_dinheiro/app/pages/login_de_usuario/componenetes/senha_enter_text.dart';
import 'package:control_do_dinheiro/app/pages/login_de_usuario/componenetes/usuario_enter_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'componentes/secao_de_foto_do_perfil.dart';

class CadastroDeUsuarioPage extends StatefulWidget {
  @override
  _CadastroDeUsuarioPageState createState() => _CadastroDeUsuarioPageState();
}

class _CadastroDeUsuarioPageState extends State<CadastroDeUsuarioPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocBuilder<CadastroDeUsuarioCubit, EstadoDoCadastro>(
      builder: (context, state) {
        return body(
          size,
          context,
          state,
        );
      },
    );
  }

  Scaffold body(Size size, BuildContext context, EstadoDoCadastro state) {
    var _controller = BlocProvider.of<CadastroDeUsuarioCubit>(context);
    return Scaffold(
      backgroundColor: Color(0xff282936),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              SizedBox(height: size.height * .05),
              SecapDeFotoDoPerfil(),
              SizedBox(height: 40),
              PrimaryEnterText(
                controller: _controller.nomeCompletoController,
                title: 'Nome completo',
              ),
              SizedBox(height: 15),
              PrimaryEnterText(
                controller: _controller.userName,
                title: 'Nome do usuario',
              ),
              SizedBox(height: 15),
              SenhaEnterText(
                senhaTextController: _controller.senhaController,
                title: 'Palavra-passe',
              ),
              SizedBox(height: 15),
              SenhaEnterText(
                senhaTextController: _controller.confirmaSenhaController,
                title: 'Confirmar Palavra-passe',
              ),
              SizedBox(height: 25),
              PrimaryButton(
                title: 'Cadastrar',
                onPressed: _controller.cadastrar,
              ),
              SizedBox(height: 10),
              PrimaryButton(
                title: 'Cancelar',
                onPressed: _controller.cancelar,
                color: Colors.red,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
