import 'dart:io';

import 'package:control_do_dinheiro/app/pages/home_page/componentes/valor_presente.dart';
import 'package:control_do_dinheiro/core/modules/entitys/trabalhador.dart';
import 'package:flutter/material.dart';

import 'mostrar_dinheiro.dart';

class Registro {
  final Trabalhador trabalhador;
  final List<Trabalhador> trabalhadoresAuxiliares;
  final String nomeDoFuncionario;
  final double entrada;
  final double saida;
  double presente;
  final DateTime dateTime;

  Registro({
    this.trabalhador,
    this.trabalhadoresAuxiliares,
    this.nomeDoFuncionario,
    this.entrada,
    this.saida,
    this.dateTime,
  }) {
    presente = entrada - saida;
  }
}

class RegistroItem extends StatelessWidget {
  final Registro registro;
  RegistroItem({
    Key key,
    this.registro,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.06),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Body(registro: registro),
    );
  }
}

class Body extends StatelessWidget {
  const Body({
    Key key,
    @required this.registro,
  }) : super(key: key);

  final Registro registro;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Avatar(trabalhador: registro.trabalhador),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  registro.nomeDoFuncionario,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  registro.dateTime.toString().substring(0, 20 - 1),
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(width: 10),
        // if (registro.trabalhadoresAuxiliares != null)
        //   SingleChildScrollView(
        //     scrollDirection: Axis.horizontal,
        //     child: Row(
        //       children: registro.trabalhadoresAuxiliares.map(
        //         (trab) {
        //           return Padding(
        //             padding: const EdgeInsets.all(8.0),
        //             child: Column(
        //               children: [
        //                 Avatar(trabalhador: trab),
        //                 Text(trab.nome),
        //               ],
        //             ),
        //           );
        //         },
        //       ).toList(),
        //     ),
        //   ),
        SizedBox(height: 20),
        Row(
          children: [
            MostrarDinheiro(
              titlo: 'Entrada',
              valor: registro.entrada,
              color: Colors.greenAccent,
            ),
            Spacer(),
            MostrarDinheiro(
              titlo: 'Saida',
              valor: registro.saida,
              color: Colors.redAccent,
            ),
          ],
        ),
        SizedBox(height: 25),
        Align(
          alignment: Alignment.topCenter,
          child: ValorPresente(
            valor: registro.presente,
            color: Colors.purpleAccent,
          ),
        ),
      ],
    );
  }
}

class Avatar extends StatelessWidget {
  const Avatar({
    Key key,
    @required this.trabalhador,
  }) : super(key: key);

  final Trabalhador trabalhador;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(90),
        image: DecorationImage(
          image: (trabalhador.urlDaFoto == null || trabalhador.urlDaFoto == '')
              ? AssetImage('assets/profile.JPG')
              : FileImage(
                  File(trabalhador.urlDaFoto),
                ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
