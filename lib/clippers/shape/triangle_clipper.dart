import 'package:flutter/material.dart';

class TriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    /*

      (0,0)     x      (x,0)
      |-----------------|
      |                 |
    y |                 | y
      |                 |
      |-----------------|
      (0,y)     x      (x,y)

    */

    double x = size.width;
    double y = size.height;

    double startX = 0;
    double startY = 0;

    final path = Path()
      ..moveTo(startX, startY)
      ..lineTo(x/2, y)
      ..lineTo(x - startX, startY)
      ..lineTo(startX, startY)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(TriangleClipper oldClipper) => false;

}