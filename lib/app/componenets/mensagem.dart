import 'package:flutter/material.dart';

class Mensagem extends StatelessWidget {
  const Mensagem({
    Key key,
    @required this.icon,
    @required this.mensagem,
  }) : super(key: key);

  final String mensagem;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: SimpleDialog(
        children: [
          Center(
            child: Column(
              children: [
                icon,
                Text(
                  mensagem,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
