import 'package:flutter/material.dart';

class AnimatedDotLoadingIndicatorWidget extends StatefulWidget {
  final Color color;
  final double size;

  const AnimatedDotLoadingIndicatorWidget({
    super.key,
    this.color = Colors.blueAccent,
    this.size = 50.0,
  });

  @override
  State<AnimatedDotLoadingIndicatorWidget> createState() => _AnimatedDotLoadingIndicatorWidgetState();
}

class _AnimatedDotLoadingIndicatorWidgetState extends State<AnimatedDotLoadingIndicatorWidget> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size,
      height: widget.size / 2,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(3, (index) {
          return AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              final double start = index * 0.2;
              final double end = start + 0.4;
              final double value = Curves.easeInOut.transform(
                (_controller.value >= start && _controller.value <= end)
                  ? (_controller.value - start) / (end - start)
                  : 0.0,
              );

              // Create a wave effect: 0 -> 1 -> 0
              final double wave = value <= 0.5 ? value * 2 : (1.0 - value) * 2;

              // Color transition
              final Color currentColor = Color.lerp(
                widget.color.withValues(alpha: 0.5),
                widget.color,
                wave,
              )!;

              return Transform.translate(
                offset: Offset(0, -wave * 12), // Increased bounce height slightly
                child: Container(
                  width: widget.size / 5,
                  height: widget.size / 5,
                  decoration: BoxDecoration(
                    color: currentColor,
                    shape: BoxShape.circle,
                  ),
                ),
              );
            },
          );
        }),
      ),
    );
  }
}
