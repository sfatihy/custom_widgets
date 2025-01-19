import 'dart:math';

import 'package:flutter/material.dart';

class OctantCircleClipper extends CustomClipper<Path> {
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

    double degToRad(num deg) => deg * (pi / 180.0);

    double x1 = x - ((x * sqrt(2)) / 2);
    double y1 = y - ((y * sqrt(2)) / 2);
    double x2 = x;
    double y2 = 0;

    double midX = (x1 + x2) / 2;
    double midY = (y1 + y2) / 2;

    final path = Path()
      ..moveTo(x1, y1)
    //..lineTo(x, 0)
      ..quadraticBezierTo(midX, 0, x2, y2)
    /*..arcToPoint(
        Offset(x, 0),
        radius: Radius.circular(32),
        rotation: pi,
      )*/

    //..lineTo(x*0.2, y*0.2)
      ..lineTo(x, y)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;

}

class OctantCircleClipper2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    final radius = size.width / 2;

    // Merkez nokta
    final center = Offset(size.width / 2, size.height / 2);

    // Başlangıç noktası (merkez)
    path.moveTo(center.dx, center.dy);

    // İlk kenar çizgisi
    path.lineTo(size.width, size.height / 2);

    // Yay çizimi
    path.arcTo(
        Rect.fromCircle(center: center, radius: radius),
        0,  // başlangıç açısı
        pi/6, // 45 derece (pi/4 radyan)
        false
    );

    // Merkeze geri dön
    path.lineTo(center.dx, center.dy);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}