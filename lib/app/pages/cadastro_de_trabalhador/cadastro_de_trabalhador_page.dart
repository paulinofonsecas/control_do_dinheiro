import 'dart:io';

import 'package:control_do_dinheiro/app/cubits/cadastro_de_trabalhadores/cadastro_de_trabalhadores_cubit.dart';
import 'package:control_do_dinheiro/app/cubits/cadastro_de_usuario/cadastro_de_usuario_cubit.dart';
import 'package:control_do_dinheiro/app/pages/cadastro_de_trabalhador/componentes/botao_para_selecionar_data_de_nascimento.dart';
import 'package:control_do_dinheiro/app/pages/login_de_usuario/componenetes/usuario_enter_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class CadastroDeTrabalhador extends StatefulWidget {
  @override
  _CadastroDeTrabalhadorState createState() => _CadastroDeTrabalhadorState();
}

class _CadastroDeTrabalhadorState extends State<CadastroDeTrabalhador> {
  TextEditingController salarioTextController;

  @override
  void initState() {
    salarioTextController = TextEditingController();
    super.initState();
  }

  CadastroDeTrabalhadoresCubit controller;
  String urlImage;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<CadastroDeTrabalhadoresCubit, EstadoDeForulario>(
        builder: (context, state) {
          controller = BlocProvider.of<CadastroDeTrabalhadoresCubit>(context);
          return Scaffold(
            body: Container(
              width: double.infinity,
              height: double.infinity,
              child: buildItens(),
            ),
          );
        },
      ),
    );
  }

  Padding buildItens() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: ListView(
        children: [
          Center(
            child: GestureDetector(
              onTap: () async {
                var pikedFile = await ImagePicker.platform
                    .pickImage(source: ImageSource.camera);
                var urlDaImagem = pikedFile.path;
                setState(() => urlImage = urlDaImagem);
                controller.setUrlImage(urlDaImagem);
              },
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(
                    color: Colors.white,
                  ),
                  image: DecorationImage(
                    image: urlImage == null
                        ? AssetImage('assets/profile.JPG')
                        : FileImage(
                            File(urlImage),
                          ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          PrimaryEnterText(
            title: 'Nome Completo',
            controller: controller.nomeController,
          ),
          SizedBox(height: 15),
          PrimaryEnterText(
            title: 'BI',
            controller: controller.biController,
          ),
          SizedBox(height: 10),
          PrimaryEnterText(
            title: 'Morada',
            controller: controller.moradaController,
          ),
          SizedBox(height: 15),
          BotaoParaSelecionarADataDeNascimento(
            onTap: controller.selecionarData,
          ),
          SizedBox(height: 15),
          PrimaryEnterText(
            title: 'Salário',
            keyboardType: TextInputType.number,
            controller: controller.salarioController,
          ),
          SizedBox(height: 30),
          buildButtons(),
        ],
      ),
    );
  }

  Padding buildButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: controller.salvar,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.green,
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 40,
                vertical: 10,
              ),
              child: Text(
                'Salvar',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: controller.cancelar,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.red,
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 40,
                vertical: 10,
              ),
              child: Text(
                'Cancelar',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
