import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({
    Key key,
    @required this.title,
    this.style,
  }) : super(key: key);

  final String title;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * .40,
      child: Align(
        child: Text(
          title,
          style: style ??
              TextStyle(
                color: Colors.white,
                fontSize: size.height * .08,
              ),
        ),
      ),
    );
  }
}