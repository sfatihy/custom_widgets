import 'package:flutter/material.dart';

class AnimatedHeartPainter extends CustomPainter {
  final double progress;

  AnimatedHeartPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final double x = size.width;
    final double y = size.height;

    final outlinePaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..color = Colors.redAccent;

    final fillPaint = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.redAccent.withOpacity(progress);

    final path = Path()
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

    canvas.drawPath(path, fillPaint);

    canvas.drawPath(path, outlinePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}