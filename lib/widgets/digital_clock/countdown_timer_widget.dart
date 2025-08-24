import 'package:flutter/material.dart';

import 'digital_clock.dart';

class CountdownTimerWidget extends StatelessWidget {
  final int time;
  final int remainingSeconds;

  final Index index = Index();

  CountdownTimerWidget({
    super.key,
    required this.time,
    required this.remainingSeconds,
  });

  Widget colon() {
    return SizedBox(
      width: 15,
      child: Column(
        children: [
          Container(
            height: 5,
            decoration: const BoxDecoration(
              color: Colors.white24,
              shape: BoxShape.circle
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            height: 5,
            decoration: const BoxDecoration(
              color: Colors.white24,
              shape: BoxShape.circle
            ),
          )
        ],
      ),
    );
  }

  Widget timeDigit(Time time) {
    return SizedBox(
      height: 50,
      width: 25,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: index.horizontalIndex(time.top, Location.top),
          ),

          Align(
            alignment: Alignment.topCenter - Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                index.verticalIndex(time.leftTop, Location.left),
                index.verticalIndex(time.rightTop, Location.right)
              ],
            ),
          ),

          Align(
            alignment: Alignment.center,
            child: index.horizontalIndex(time.middle, Location.middle)
          ),

          Align(
            alignment: Alignment.bottomCenter - Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                index.verticalIndex(time.leftBottom, Location.left),
                index.verticalIndex(time.rightBottom, Location.right)
              ],
            ),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: index.horizontalIndex(time.bottom, Location.bottom)
          ),
        ],
      ),
    );
  }

  BoxDecoration _buildBoxDecoration({
    required Color primaryColor,
    required Color secondaryColor,
    double spreadRadius = 1.0,
  }) {
    return BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomLeft,
        colors: [primaryColor, secondaryColor, primaryColor],
      ),
      boxShadow: [
        BoxShadow(
          color: secondaryColor,
          offset: const Offset(-3, 3),
          blurRadius: 2,
          spreadRadius: spreadRadius,
        ),
      ],
      borderRadius: BorderRadius.circular(12),
    );
  }

  @override
  Widget build(BuildContext context) {
    int hours = remainingSeconds ~/ 3600;
    int minutes = (remainingSeconds % 3600) ~/ 60;
    int seconds = remainingSeconds % 60;

    final String hourStr = hours.toString().padLeft(2, '0');
    final String minuteStr = minutes.toString().padLeft(2, '0');
    final String secondStr = seconds.toString().padLeft(2, '0');

    return AnimatedContainer(
      duration: const Duration(seconds: 1),
      curve: Curves.slowMiddle,
      decoration: remainingSeconds > time / 6
        ? _buildBoxDecoration(
          primaryColor: Colors.cyanAccent,
          secondaryColor: Colors.green,
        )
        : remainingSeconds % 2 == 1
          ? _buildBoxDecoration(
            primaryColor: Colors.red,
            secondaryColor: Colors.green,
            spreadRadius: 3.0,
          )
          : _buildBoxDecoration(
            primaryColor: Colors.cyanAccent,
            secondaryColor: Colors.green,
          ),
      padding: const EdgeInsets.all(8),
      child: AnimatedContainer(
        duration: const Duration(seconds: 1),
        curve: Curves.slowMiddle,
        padding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 8
        ),
        decoration: BoxDecoration(
          color: remainingSeconds > time / 6
            ? Colors.cyan
            : remainingSeconds % 2 == 1
            ? Colors.red
            : Colors.cyan,
          borderRadius: BorderRadius.circular(8)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Hours
            ... time >= 3600 ? [
              timeDigit(Time.time(int.parse(hourStr[0]))),
              const SizedBox(width: 2.5),
              timeDigit(Time.time(int.parse(hourStr[1]))),
              colon(),
            ] : [],

            // Minutes
            timeDigit(Time.time(int.parse(minuteStr[0]))),
            const SizedBox(width: 2.5),
            timeDigit(Time.time(int.parse(minuteStr[1]))),

            colon(),

            // Seconds
            timeDigit(Time.time(int.parse(secondStr[0]))),
            const SizedBox(width: 2.5),
            timeDigit(Time.time(int.parse(secondStr[1])))
          ],
        ),
      ),
    );
  }
}