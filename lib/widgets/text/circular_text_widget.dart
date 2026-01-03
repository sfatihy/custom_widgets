import 'dart:math';

import 'package:flutter/material.dart';

class CircularText extends StatelessWidget {
  final String text;
  final double radius;
  final TextStyle? style;
  final double startAngle;

  const CircularText({
    super.key,
    required this.text,
    this.radius = 100,
    this.style,
    this.startAngle = -pi / 2,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(radius * 2, radius * 2),
      painter: CircularTextPainter(text, radius, style, startAngle),
    );
  }
}

class CircularTextPainter extends CustomPainter {
  final String text;
  final double radius;
  final TextStyle? style;
  final double startAngle;

  CircularTextPainter(this.text, this.radius, this.style, this.startAngle);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final anglePerChar = 2 * pi / text.length;
    final textStyle = style ?? const TextStyle(color: Colors.black, fontSize: 16);

    for (int i = 0; i < text.length; i++) {
      final angle = i * anglePerChar + startAngle;
      final offset = Offset(
        center.dx + radius * cos(angle),
        center.dy + radius * sin(angle),
      );

      final textSpan = TextSpan(text: text[i], style: textStyle);
      final textPainter = TextPainter(
        text: textSpan,
        textDirection: TextDirection.ltr,
      )..layout();

      canvas.save();
      canvas.translate(offset.dx, offset.dy);
      canvas.rotate(angle + pi / 2);
      textPainter.paint(canvas, Offset(-textPainter.width / 2, -textPainter.height / 2));
      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
