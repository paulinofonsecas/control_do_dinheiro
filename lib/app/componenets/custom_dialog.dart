import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({
    Key key,
    @required this.mensagem,
    @required this.secundary,
    @required this.primary,
  }) : super(key: key);

  final String mensagem;
  final Function secundary;
  final Function primary;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SimpleDialog(
      contentPadding: EdgeInsets.all(20),
      children: [
        Container(
          width: double.infinity,
          height: size.height * .20,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Spacer(),
              Positioned(
                right: 0,
                child: Text(mensagem),
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FlatButton(
                    onPressed: secundary,
                    child: Text('Não'),
                  ),
                  FlatButton(
                    onPressed: primary,
                    child: Text(
                      'Sim',
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
