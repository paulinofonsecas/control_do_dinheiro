
import 'package:control_do_dinheiro/app/pages/home_page/componentes/mostrar_dinheiro.dart';
import 'package:flutter/material.dart';

class TrabalhadorItem extends StatelessWidget {
  const TrabalhadorItem({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * .60,
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.06),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(90),
              image: DecorationImage(
                image: AssetImage('assets/profile.JPG'),
              ),
            ),
            width: 150,
            height: 150,
          ),
          SizedBox(height: 10),
          Text(
            'Paulino Ciaia',
            style: TextStyle(
              fontSize: 30,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 25),
          Column(
            children: [
              MostrarDinheiro(titlo: 'Entrada', valor: 40000),
              SizedBox(height: 18),
              MostrarDinheiro(
                titlo: 'Saida',
                valor: 10000,
                color: Colors.red,
              ),
            ],
          )
        ],
      ),
    );
  }
}
