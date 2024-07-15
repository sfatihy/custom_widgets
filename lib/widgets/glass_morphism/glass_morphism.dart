import 'dart:ui';

import 'package:flutter/material.dart';

class GlassMorphism extends StatelessWidget {

  final Widget child;
  final double blur;
  final double opacity;
  final Color color;
  final Border? border;
  final BorderRadius? borderRadius;

  const GlassMorphism({
    super.key,
    required this.child,
    required this.blur,
    required this.opacity,
    this.color = Colors.white,
    this.border,
    this.borderRadius
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.circular(12),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: color.withOpacity(opacity),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [color.withOpacity(0.1), color.withOpacity(opacity <= 0.5 ? opacity * 2 : opacity)],
              stops: const [0.75,1]
            ),
            border: border ?? Border.all(
              color: color.withOpacity(opacity <= 0.5 ? opacity * 2 : opacity),
              width: 0.75
            ),
            borderRadius: borderRadius ?? BorderRadius.circular(12)
          ),
          child: child,
        ),
      ),
    );
  }
}
