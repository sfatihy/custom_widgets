import 'package:flutter/material.dart';

class HeartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..color = Colors.red;

    final path = Path();

    double x = size.width;
    double y = size.height;

    path
      ..moveTo(x * 0.5, y * 0.4)
      ..cubicTo(
        x * 0.2, -y * 0.1, // Sol eğri kontrol noktaları
        -x * 0.1, y * 0.4, // Sol alt kontrol noktaları
        x * 0.5, y * 0.9,  // Alt birleşim noktası
      )
      ..cubicTo(
        x * 1.1, y * 0.4,  // Sağ alt kontrol noktaları
        x * 0.8, -y * 0.1, // Sağ eğri kontrol noktaları
        x * 0.5, y * 0.4, // Üst birleşim noktası
      )
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;

  @override
  bool hitTest(Offset position) {
    Path path = Path();
    double x = 200;
    double y = 200;

    path..moveTo(x * 0.5, y * 0.3)
      ..quadraticBezierTo(x * 0.075, 0, x * 0.075, y * 0.5)
    //..lineTo(x * 0.5, y)
    //..cubicTo(x * 0.075, y * 0.5, x * 0.35, y * 0.7, x * 0.45, y * 0.9)
      ..quadraticBezierTo(x * 0.425, y * 0.8, x * 0.45, y * 0.9)
      ..lineTo(x - x * 0.075, y * 0.5)
      ..quadraticBezierTo(x - x * 0.075, 0, x * 0.5, y * 0.3)
      ..close();
    path.close();
    return path.contains(position);
  }
}