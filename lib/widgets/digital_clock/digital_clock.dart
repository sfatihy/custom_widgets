/*
      _
    | _ |
    | _ |
*/

import 'package:flutter/material.dart';

enum Location {
  top,
  right,
  left,
  middle,
  bottom
}

class Time {
  bool top = false;
  bool leftTop = false;
  bool rightTop = false;
  bool middle = false;
  bool leftBottom = false;
  bool rightBottom = false;
  bool bottom = false;

  Time();

  Time.zero () {
    top = true;
    leftTop = true;
    rightTop = true;
    leftBottom = true;
    rightBottom = true;
    bottom = true;
  }

  Time.one() {
    rightTop = true;
    rightBottom = true;
  }

  Time.two() {
    top = true;
    rightTop = true;
    middle = true;
    leftBottom = true;
    bottom = true;
  }

  Time.three() {
    top = true;
    rightTop = true;
    middle = true;
    rightBottom = true;
    bottom = true;
  }

  Time.four() {
    leftTop = true;
    rightTop = true;
    middle = true;
    rightBottom = true;
  }

  Time.five() {
    top = true;
    leftTop = true;
    middle = true;
    rightBottom = true;
    bottom = true;
  }

  Time.six() {
    top = true;
    leftTop = true;
    middle = true;
    leftBottom = true;
    rightBottom = true;
    bottom = true;
  }

  Time.seven() {
    top = true;
    rightTop = true;
    rightBottom = true;
  }

  Time.eight() {
    top = true;
    leftTop = true;
    rightTop = true;
    middle = true;
    leftBottom = true;
    rightBottom = true;
    bottom = true;
  }

  Time.nine() {
    top = true;
    leftTop = true;
    rightTop = true;
    middle = true;
    rightBottom = true;
  }

  static Time time (int number) {
    switch (number) {
      case 0:
        return Time.zero();
      case 1:
        return Time.one();
      case 2:
        return Time.two();
      case 3:
        return Time.three();
      case 4:
        return Time.four();
      case 5:
        return Time.five();
      case 6:
        return Time.six();
      case 7:
        return Time.seven();
      case 8:
        return Time.eight();
      case 9:
        return Time.nine();
      default:
        return Time();
    }
  }
}

class Index {
  Duration duration = const Duration(milliseconds: 150);
  Curve curve = Curves.bounceIn;
  Color activeColor = Colors.white;
  Color passiveColor = Colors.white30;

  Widget horizontalIndex(bool isOpen, Location location) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      curve: Curves.bounceIn,
      height: 5,
      width: 25,
      decoration: BoxDecoration(
        color: isOpen ? activeColor : passiveColor,
        borderRadius: location == Location.top ?
        const BorderRadius.vertical(
          bottom: Radius.circular(6)
        ) : location == Location.bottom ?
        const BorderRadius.vertical(
          top: Radius.circular(6)
        ) :
        BorderRadius.circular(6)
      ),
    );
  }

  Widget verticalIndex(bool isOpen, Location location) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      curve: Curves.bounceIn,
      height: 25,
      width: 5,
      decoration: BoxDecoration(
        color: isOpen ? activeColor : passiveColor,
        borderRadius: location == Location.left ?
        const BorderRadius.horizontal(
          right: Radius.circular(12)
        ) :
        const BorderRadius.horizontal(
          left: Radius.circular(12)
        )
      ),
    );
  }
}