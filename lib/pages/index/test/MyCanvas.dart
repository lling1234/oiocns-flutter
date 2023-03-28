import 'package:flutter/material.dart';

class MyCanvas extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.blue;
    canvas.drawCircle(Offset(size.width / 2, size.height / 2), size.width / 2, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class MyWidgetCanvas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(painter: MyCanvas());
  }
}