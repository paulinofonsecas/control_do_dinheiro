import 'dart:io';

import 'package:control_do_dinheiro/core/modules/entitys/trabalhador.dart';
import 'package:flutter/material.dart';

class TrabalhadorItem extends StatelessWidget {
  final Trabalhador trabalhador;
  const TrabalhadorItem({
    Key key,
    this.trabalhador,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        height: size.height * .60,
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(.06),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(90),
                image: DecorationImage(
                  image: (trabalhador.urlDaFoto == null || trabalhador.urlDaFoto == '')
                      ? AssetImage('assets/profile.JPG')
                      : FileImage(File(trabalhador.urlDaFoto)),
                  fit: BoxFit.cover,
                ),
              ),
              width: 100,
              height: 100,
            ),
            SizedBox(height: 10),
            Text(
              trabalhador.nome,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            // SizedBox(height: 25),
            // Column(
            //   children: [
            //     MostrarDinheiro(titlo: 'Total de Entrada', valor: 40000),
            //     SizedBox(height: 18),
            //     MostrarDinheiro(
            //       titlo: 'Total de Saida',
            //       valor: 10000,
            //       color: Colors.red,
            //     ),
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}
