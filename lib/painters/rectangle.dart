import 'package:flutter/material.dart';

class RectanglePainter extends CustomPainter {
  final Rect rect;
  RectanglePainter({
    required this.rect,
  });
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.blue 
      ..style = PaintingStyle.stroke 
      ..strokeWidth = 2.0; 

    canvas.drawRect(rect, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
