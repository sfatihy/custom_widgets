import 'dart:math';

import 'package:flutter/material.dart';

class HalfCircleClipper extends CustomClipper<Path> {
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
        Rect.fromLTWH(0, 0, x, y * 2),
        pi,
        pi,
        false
      )
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;

}