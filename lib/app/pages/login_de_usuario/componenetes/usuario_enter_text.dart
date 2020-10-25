import 'package:flutter/material.dart';

class UsuarioEnterText extends StatelessWidget {
  const UsuarioEnterText({
    Key key,
    @required this.usuarioTextController,
  }) : super(key: key);

  final TextEditingController usuarioTextController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        controller: usuarioTextController,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          labelText: 'Nome de Usuario',
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
