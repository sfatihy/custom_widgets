import 'package:flutter/material.dart';

class AnimatedNumberWidget extends StatefulWidget {

  final int number;

  const AnimatedNumberWidget({
    super.key,
    required this.number
  });

  @override
  State<AnimatedNumberWidget> createState() => _AnimatedNumberWidgetState();
}

class _AnimatedNumberWidgetState extends State<AnimatedNumberWidget> with TickerProviderStateMixin {

  late Animation animation;
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      duration: const Duration(milliseconds: 1750),
      vsync: this
    );

    animation = IntTween(
      begin: 9,
      end: 0
    ).animate(
      CurvedAnimation(
        curve: Curves.linear,
        parent: animationController,
      )
    );

    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget? child) {

        if (animation.value == widget.number) {
          animationController.stop();
        }

        return Text(
          animation.value.toString(),
          style: const TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w300,
            height: 0,
          ),
        );
      },
    );
  }
}
