import 'package:flutter/material.dart';

class IconPainter extends CustomPainter {
  final Color color;
  final bool isEntrada;
  IconPainter({
    this.color,
    this.isEntrada = true,
  });

  @override
  void paint(Canvas canvas, Size size) {
    var path1 = Path();
    path1.moveTo(0, size.height);
    path1.lineTo(size.width / 2, 0);
    path1.lineTo(size.width, size.height);
    var path2 = Path();
    path2.moveTo(0, 0);
    path2.lineTo(size.width / 2, size.height);
    path2.lineTo(size.width, 0);

    canvas.drawPath(
      isEntrada ? path1 : path2,
      Paint()..color = color ?? Colors.greenAccent,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}
