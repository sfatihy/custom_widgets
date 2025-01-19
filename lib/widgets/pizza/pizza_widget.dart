import 'dart:math';

import 'package:flutter/material.dart';

import '../../clippers/pizza_slice_clipper.dart';

class PizzaWidget extends StatelessWidget {

  final int sliceCount;

  const PizzaWidget({
    super.key,
    required this.sliceCount
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 300,
        width: 300,
        decoration: BoxDecoration(
          color: Colors.red.shade100,
          border: Border.all(
            color: Colors.black,
            width: 2.5,
          ),
          shape: BoxShape.circle,
        ),
        child: Stack(
          children: List.generate(
            sliceCount,
            (index) => Transform.rotate(
              angle: index * (2 * pi / sliceCount),
              child: ClipPath(
                clipper: PizzaSliceClipper(sliceCount: sliceCount),
                child: Container(
                  width: 300,
                  height: 300,
                  color: Colors.primaries[index % Colors.primaries.length],
                  child: Align(
                    alignment: const Alignment(0.5,0.5),
                    child: Transform.rotate(
                      angle: -index * (2 * pi / sliceCount),
                      child: Text(
                        '${index + 1}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
