import 'package:control_do_dinheiro/app/pages/home_page/componentes/valor_presente.dart';
import 'package:flutter/material.dart';

import 'mostrar_dinheiro.dart';

class Registro {
  final String nomeDoFuncionario;
  final double entrada;
  final double saida;
  double presente;
  final DateTime dateTime;

  Registro({
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
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(90),
                image: DecorationImage(
                  image: AssetImage('assets/profile.JPG'),
                ),
              ),
            ),
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
