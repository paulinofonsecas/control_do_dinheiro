import 'package:flutter/material.dart';

class SenhaEnterText extends StatelessWidget {
  const SenhaEnterText({
    Key key,
    @required this.title,
    @required this.senhaTextController,
  }) : super(key: key);

  final String title;
  final TextEditingController senhaTextController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        controller: senhaTextController,
        obscureText: true,
        style: TextStyle(
          color: Colors.white,
          fontSize: 25,
        ),
        decoration: InputDecoration(
          labelText: title,
          labelStyle: TextStyle(
            fontSize: 25,
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
