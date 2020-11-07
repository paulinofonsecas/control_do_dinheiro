import 'package:flutter/material.dart';

class CustomBtnAdd extends StatelessWidget {
  const CustomBtnAdd({
    Key key,
    this.icon,
    this.onTap,
  }) : super(key: key);

  final IconData icon;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(90),
        ),
        child: Center(
          child: Icon(
            icon ?? Icons.add,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
