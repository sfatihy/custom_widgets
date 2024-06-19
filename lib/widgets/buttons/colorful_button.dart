import 'package:flutter/material.dart';

class ColorfulButton extends StatelessWidget {

  final Widget child;
  final Function() onTap;
  final Gradient? gradient;
  final Color? highlightColor;
  final MaterialStateProperty<Color?>? overlayColor;
  final Color? splashColor;

  const ColorfulButton({
    super.key,
    required this.child,
    required this.onTap,
    this.gradient,
    this.highlightColor,
    this.overlayColor,
    this.splashColor
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      highlightColor: highlightColor,
      overlayColor: overlayColor,
      splashColor: splashColor,
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: gradient ?? const LinearGradient(
            colors: [Color(0xFFFFD840), Color(0xFFF3ACFF), Color(0xFF8AECFF)]
          )
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white60,
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 24
          ),
          child: child
        ),
      ),
    );
  }
}
