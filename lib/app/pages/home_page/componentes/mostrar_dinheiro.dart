import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'icon_painter.dart';

class MostrarDinheiro extends StatelessWidget {
  MostrarDinheiro({
    Key key,
    @required this.titlo,
    this.valor,
    this.color,
  }) : super(key: key);

  final Color color;
  final String titlo;
  final double valor;

  final numberFormat = NumberFormat('###,###,###,###.00');

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CustomPaint(
              size: Size(20, 20),
              painter: IconPainter(
                isEntrada: 'Entrada' == titlo ? true : false,
                color: color ?? Colors.greenAccent,
              ),
            ),
            SizedBox(width: 10),
            Text(
              titlo,
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16.0, top: 8),
          child: Text(
            '${numberFormat.format(valor)} Kz',
            style: TextStyle(
              color: color ?? Colors.greenAccent,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}