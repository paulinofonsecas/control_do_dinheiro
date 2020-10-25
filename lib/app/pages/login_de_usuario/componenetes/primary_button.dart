import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    Key key,
    @required this.title,
    this.color,
  }) : super(key: key);

  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: size.height * .07,
      margin: EdgeInsets.symmetric(horizontal: 30),
      decoration: BoxDecoration(
        color: color ?? Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(18),
        // boxShadow: [
        //   BoxShadow(
        //     color: color ?? Theme.of(context).primaryColor.withOpacity(0.3),
        //     blurRadius: 4,
        //     offset: Offset(0, 2),
        //   ),
        // ],
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
