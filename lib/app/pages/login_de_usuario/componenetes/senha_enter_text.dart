import 'package:flutter/material.dart';

class SenhaEnterText extends StatelessWidget {
  const SenhaEnterText({
    Key key,
    @required this.senhaTextController,
  }) : super(key: key);

  final TextEditingController senhaTextController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: TextField(
        controller: senhaTextController,
        obscureText: true,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          labelText: 'Palavra-passe',
          labelStyle: TextStyle(
            color: Colors.white,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
