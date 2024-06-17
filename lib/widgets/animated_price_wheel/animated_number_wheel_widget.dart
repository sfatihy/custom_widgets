import 'dart:async';

import 'package:flutter/material.dart';

class AnimatedNumberWheelWidget extends StatefulWidget {

  final int number;

  const AnimatedNumberWheelWidget({
    super.key,
    required this.number
  });

  @override
  State<AnimatedNumberWheelWidget> createState() => _AnimatedNumberWheelWidgetState();
}

class _AnimatedNumberWheelWidgetState extends State<AnimatedNumberWheelWidget> with TickerProviderStateMixin {

  late final FixedExtentScrollController fixedExtentScrollController;

  @override
  void initState() {
    super.initState();

    fixedExtentScrollController = FixedExtentScrollController();

    Timer(const Duration(milliseconds: 1), () {
      fixedExtentScrollController.animateToItem(10 - widget.number, duration: const Duration(milliseconds: 2000), curve: Curves.fastEaseInToSlowEaseOut);
    });
  }

  @override
  void dispose() {
    fixedExtentScrollController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.0375,
      height: MediaQuery.of(context).size.height * 0.0375,
      child: ListWheelScrollView(
        physics: const NeverScrollableScrollPhysics(),
        controller: fixedExtentScrollController,
        diameterRatio: 0.8,
        overAndUnderCenterOpacity: 0,
        itemExtent: 100,
        children: List.generate(
          11,
          (index) => Center(
            child: Text(
              '${10-index}',
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w300,
                height: 0,
              ),
            )
          )
        ),
      ),
    );
  }
}