import 'package:flutter/material.dart';

import '../../clippers/heart_clipper.dart';

import '../../painters/heart_painter.dart';

class HeartButton extends StatefulWidget {
  const HeartButton({super.key});

  @override
  State<HeartButton> createState() => _HeartButtonState();
}

class _HeartButtonState extends State<HeartButton> {

  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: HeartClipper(),
      child: InkWell(
        splashColor: isLiked ? Colors.white : Colors.red,
        splashFactory: InkSparkle.splashFactory,
        highlightColor: Colors.transparent,
        radius: 0,
        onTap: () async {
          setState(() {
            isLiked = !isLiked;
          });
        },
        child: CustomPaint(
          painter: HeartPainter(),
          child: Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              color: !isLiked ? Colors.white10 : Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}
