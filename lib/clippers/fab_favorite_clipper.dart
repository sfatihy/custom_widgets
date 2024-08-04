import 'package:flutter/material.dart';

class FabFavoriteClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    double x = size.width;
    double y = size.height;

    double cY = y * 0.5;

    path.moveTo(0, cY);
    path.cubicTo(x * 0.25, cY, x * 0.33, y * 0.001, x/2, y * 0.35);
    path.cubicTo(x - (x * 0.33), y * 0.001, x - (x * 0.25), cY, x, cY);
    path.lineTo(x, y);
    path.lineTo(0, y);

    return path;
  }

  @override
  bool shouldReclip(FabFavoriteClipper oldClipper) => false;
}