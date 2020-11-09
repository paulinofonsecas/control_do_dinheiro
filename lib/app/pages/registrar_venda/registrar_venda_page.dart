import 'package:control_do_dinheiro/app/componenets/custom_appbar.dart';
import 'package:control_do_dinheiro/app/controllers/registrar_venda_controller.dart';
import 'package:control_do_dinheiro/app/pages/login_de_usuario/componenetes/primary_button.dart';
import 'package:control_do_dinheiro/core/modules/entitys/trabalhador.dart';
import 'package:flutter/material.dart';

import 'componenets/custom_btn_add.dart';
import 'componenets/escolher_trabalhador.dart';
import 'componenets/input_money.dart';
import 'componenets/mini_photo_profile.dart';
import 'componenets/trabalhador_principal.dart';
import 'componenets/trabalhadores_auxialiares.dart';

class RegistrarVenda extends StatefulWidget {
  @override
  _RegistrarVendaState createState() => _RegistrarVendaState();
}

class _RegistrarVendaState extends State<RegistrarVenda> {
  RegistrarVendaController _controller;

  @override
  void initState() {
    _controller = RegistrarVendaController(context);
    super.initState();
  }

  Trabalhador trabalhadorPrincipal;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: FutureBuilder<List<Trabalhador>>(
              future: _controller.getTrabalhadores,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  _controller.trabalhadores = snapshot.data;
                  return body();
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              }),
        ),
      ),
    );
  }

  Container body() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: CustomAppBar(
              title: 'Registrar Venda',
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                seccaoDeTrabalhadores(),
                SizedBox(height: 40),
                InputMoney(
                  labelText: 'Entrada',
                  controller: _controller.entradaController,
                ),
                SizedBox(height: 10),
                InputMoney(
                  labelText: 'Saida',
                  controller: _controller.saidaController,
                ),
                SizedBox(height: 40),
                PrimaryButton(
                  title: 'Registrar',
                  onPressed: _controller.registrar,
                ),
                SizedBox(height: 10),
                PrimaryButton(
                  title: 'Cancelar',
                  onPressed: _controller.sair,
                  color: Colors.red,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Column seccaoDeTrabalhadores() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TrabalhadorPrincipal(
          trabalhadores: _controller.trabalhadores,
          trabalhadorPrincipal: _controller.trabalhadorPrincipal,
          onTap: () async {
            List<Trabalhador> trabalhadoresRetornados = await Navigator.push(
              context,
              PageRouteBuilder(
                barrierDismissible: false,
                opaque: false,
                barrierColor: Colors.black.withOpacity(.4),
                pageBuilder: (context, anim1, anim2) {
                  return EscolherTrabalhador(
                    only: true,
                    trabalhadores: _controller.trabalhadores,
                    trabalhadoresSelecionados: [
                      _controller.trabalhadorPrincipal
                    ],
                  );
                },
              ),
            );
            if (trabalhadoresRetornados != null)
              setState(() {
                _controller.trabalhadorPrincipal =
                    trabalhadoresRetornados.first;
              });
          },
        ),
        SizedBox(height: 30),
        TrabalhadoresAuxiliares(
          trabalhadores: _controller.trabalhadores,
          trabalhadoresSelecionados: _controller.trabalhadoresSelecionados,
          onTap: () async {
            List<Trabalhador> trabalhadoresRetornados = await Navigator.push(
              context,
              PageRouteBuilder(
                barrierDismissible: false,
                opaque: false,
                barrierColor: Colors.black.withOpacity(.4),
                pageBuilder: (context, anim1, anim2) {
                  return EscolherTrabalhador(
                    trabalhadores: _controller.trabalhadores,
                    trabalhadoresSelecionados:
                        _controller.trabalhadoresSelecionados,
                  );
                },
              ),
            );
            if (trabalhadoresRetornados != null)
              setState(() {
                _controller.trabalhadoresSelecionados = trabalhadoresRetornados;
              });
          },
        ),
      ],
    );
  }
}
