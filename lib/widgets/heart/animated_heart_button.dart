import 'package:flutter/material.dart';

import '../../clippers/heart_clipper.dart';

import '../../painters/animated_heart_painter.dart';

class AnimatedHeartButton extends StatefulWidget {
  const AnimatedHeartButton({super.key});

  @override
  State<AnimatedHeartButton> createState() => _AnimatedHeartButtonState();
}

class _AnimatedHeartButtonState extends State<AnimatedHeartButton> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
  }

  void _toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
      if (isFavorite) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: HeartClipper(),
      child: GestureDetector(
        onTap: _toggleFavorite,
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return CustomPaint(
              size: const Size(100, 100),
              painter: AnimatedHeartPainter(progress: _animation.value),
            );
          },
        ),
      ),
    );
  }
}

