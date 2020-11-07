import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final bool isEmpty;
  final List<Widget> actions;
  final String title;
  const CustomAppBar({
    Key key,
    this.isEmpty,
    this.actions,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 10,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(),
            Row(
              children: actions ?? [],
            ),
          ],
        ),
      ),
    );
  }
}
