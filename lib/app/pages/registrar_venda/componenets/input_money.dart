import 'package:flutter/material.dart';

class InputMoney extends StatelessWidget {
  const InputMoney({
    Key key,
    @required this.labelText,
  }) : super(key: key);

  final String labelText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.number,
      style: TextStyle(
        fontSize: 18,
        color: Colors.blueAccent,
      ),
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
        suffix: Text(
          'Kz',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.blue[300]),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey[300]),
        ),
      ),
    );
  }
}
