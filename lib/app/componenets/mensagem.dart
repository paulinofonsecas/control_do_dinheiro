import 'package:flutter/material.dart';

class Mensagem extends StatelessWidget {
  const Mensagem({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          Icons.verified,
          size: 120,
          color: Colors.green,
        ),
        Text(
          'Cadastro conluído',
          style: TextStyle(
            color: Colors.black,
            fontSize: 22,
          ),
        )
      ],
    );
  }
}
