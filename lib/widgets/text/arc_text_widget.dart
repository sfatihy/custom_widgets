import 'dart:math';
import 'package:flutter/material.dart';

class ArcTextWidget extends StatelessWidget {
  final String text;
  final double radius;
  final double startAngle;
  final TextStyle? style;

  const ArcTextWidget({
    super.key,
    required this.text,
    this.radius = 100,
    this.startAngle = -pi, // starts from left to right (upper semi-circle)
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(radius * 2, radius * 2),
      painter: ArcTextPainter(text, radius, startAngle, style),
    );
  }
}

class ArcTextPainter extends CustomPainter {
  final String text;
  final double radius;
  final double startAngle;
  final TextStyle? style;

  ArcTextPainter(this.text, this.radius, this.startAngle, this.style);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    const sweep = pi;
    final anglePerChar = sweep / (text.length - 1);

    final textStyle = style ?? const TextStyle(color: Colors.black, fontSize: 16);

    for (int i = 0; i < text.length; i++) {
      final angle = startAngle + i * anglePerChar;
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
      textPainter.paint(
        canvas,
        Offset(-textPainter.width / 2, -textPainter.height / 2),
      );
      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
