import 'package:flutter/material.dart';

class HeartClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
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

      /*..moveTo(x * 0.5, y * 0.3)
      ..quadraticBezierTo(x * 0.075, 0, x * 0.075, y * 0.5)
      //..lineTo(x * 0.5, y)
      //..cubicTo(x * 0.075, y * 0.5, x * 0.35, y * 0.7, x * 0.45, y * 0.9)
      ..quadraticBezierTo(x * 0.425, y * 0.8, x * 0.45, y * 0.9)
      ..lineTo(x - x * 0.075, y * 0.5)
      ..quadraticBezierTo(x - x * 0.075, 0, x * 0.5, y * 0.3)
      ..close();*/

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
