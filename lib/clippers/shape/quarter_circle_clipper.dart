import 'dart:math';

import 'package:flutter/material.dart';

class QuarterCircleClipper extends CustomClipper<Path> {
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

    final path = Path()
      ..arcTo(
        Rect.fromCenter(center: Offset(x, y), width: x * 2, height: y * 2),
        pi,
        pi,
        false
      )
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;

}