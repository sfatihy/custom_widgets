import 'dart:math';

import 'package:flutter/material.dart';

class PizzaSliceClipper extends CustomClipper<Path> {
  final int sliceCount;

  PizzaSliceClipper({required this.sliceCount});

  @override
  Path getClip(Size size) {
    final path = Path();
    final radius = size.width / 2;
    final center = Offset(size.width / 2, size.height / 2);

    path.moveTo(center.dx, center.dy);

    path.lineTo(size.width, size.height / 2);

    path.arcTo(
      Rect.fromCircle(center: center, radius: radius),
      0,
      2 * pi / sliceCount,
      false
    );

    path.lineTo(center.dx, center.dy);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
