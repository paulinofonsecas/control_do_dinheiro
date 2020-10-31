import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PrimaryEnterText extends StatelessWidget {
  const PrimaryEnterText({
    Key key,
    @required this.title,
    @required this.controller,
    this.keyboardType,
    this.onChange,
  }) : super(key: key);

  final TextEditingController controller;
  final String title;
  final TextInputType keyboardType;
  final Function(String value) onChange;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        controller: controller,
        style: TextStyle(color: Colors.white),
        keyboardType: keyboardType,
        onChanged: onChange,
        decoration: InputDecoration(
          labelText: title,
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
