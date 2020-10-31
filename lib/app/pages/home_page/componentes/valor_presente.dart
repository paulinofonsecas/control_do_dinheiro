import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ValorPresente extends StatelessWidget {
  final double valor;
  final Color color;
  final numberFormat = NumberFormat('###,###,###,###.00');

  ValorPresente({
    Key key,
    this.valor,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Presente',
            style: TextStyle(
              color: Colors.white,
              fontSize: 26,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 8),
            child: Text(
              '${numberFormat.format(valor)} Kz',
              style: TextStyle(
                color: Colors.amber,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}



