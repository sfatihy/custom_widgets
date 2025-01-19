import 'dart:math';

import 'package:flutter/material.dart';

import '../clippers/shape/half_circle_clipper.dart';
import '../clippers/shape/octant_circle_clipper.dart';
import '../clippers/shape/quarter_circle_clipper.dart';

import 'package:custom_widgets/widgets/column/custom_column_widget.dart';
import 'package:custom_widgets/widgets/divider/custom_divider_widget.dart';
import 'package:custom_widgets/widgets/pizza/pizza_widget.dart';

class PizzaView extends StatelessWidget {
  const PizzaView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pizza'),
      ),
      body: CustomColumn(
        padding: const EdgeInsets.symmetric(vertical: 8),
        gap: CustomDivider(
          lineColor: Colors.black,
          lineWidth: MediaQuery.of(context).size.width * 0.5,
          circleBorderColor: Colors.black,
        ),
        children: [
          const Text('2 Slices'),

          Container(
            color: Colors.cyan.shade100,
            child: Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                color: Colors.red.shade100,
                border: Border.all(
                  color: Colors.cyan,
                  width: 0.5,
                ),
                shape: BoxShape.circle
              ),
              child: Stack(
                alignment: Alignment.center,
                children: List.generate(
                  2,
                  (index) => Align(
                    alignment: const [Alignment(0,-1),Alignment(0,1)][index],
                    child: Transform.rotate(
                      angle: [0, pi][index].toDouble(),
                      child: ClipPath(
                        clipper: HalfCircleClipper(),
                        child: Container(
                          width: 300,
                          height: 150,
                          color: [Colors.red, Colors.blue][index],
                        ),
                      ),
                    ),
                  ),
                )
              ),
            ),
          ),

          const Text('4 Slices'),

          Container(
            color: Colors.red.shade100,
            child: Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                color: Colors.red.shade100,
                border: Border.all(
                  color: Colors.cyan,
                  width: 0.5,
                ),
                shape: BoxShape.circle
              ),
              child: Stack(
                alignment: Alignment.center,
                children: List.generate(
                  4,
                  (index) => Align(
                    alignment: const [Alignment(-1,-1), Alignment(1, -1), Alignment(1, 1), Alignment(-1, 1)][index],
                    child: Transform.rotate(
                      angle: [0, pi/2, pi, 3 * pi/2][index].toDouble(),
                      child: ClipPath(
                        clipper: QuarterCircleClipper(),
                        child: Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                            color: [Colors.red, Colors.blue, Colors.cyanAccent, Colors.deepOrange][index],
                          ),
                          child: Center(
                            child: Text(index.toString())
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ),
            ),
          ),

          const Text('8 Slices'),

          Container(
            color: Colors.red.shade100,
            child: Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                color: Colors.red.shade100,
                border: Border.all(
                  color: Colors.cyan,
                  width: 0.5,
                ),
                shape: BoxShape.circle
              ),
              child: Stack(
                  alignment: Alignment.center,
                  children: List.generate(
                    3,
                    (index) => Align(
                      alignment: const [Alignment(-1, -1), Alignment(0,-1),Alignment(1, -1),Alignment(1, 0), Alignment(0, 1), Alignment(-1, 1), Alignment(-1, 0),Alignment(-1, -1)][index],
                      child: ColoredBox(
                        color: Colors.white30,
                        child: Transform.rotate(
                          angle: [0, pi/4, pi/2, 3 * pi/4, pi, 5 * pi/4, 3 * pi/2, 7 * pi/4][index].toDouble(),
                          child: ClipPath(
                            clipper: OctantCircleClipper(),
                            child: Container(
                              width: 150,
                              height: 150,
                              decoration: BoxDecoration(
                                color: Colors.primaries[index],
                              ),
                              child: const Center(
                                child: Text('asd')
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
              ),
            ),
          ),

          Container(
            height: 300,
            width: 300,
            decoration: BoxDecoration(
              color: Colors.red.shade100,
              border: Border.all(
                color: Colors.cyan,
                width: 0.5,
              ),
              shape: BoxShape.circle,
            ),
            child: Stack(
              children: List.generate(
                12,
                (index) => Transform.rotate(
                  angle: index * pi / 6,
                  child: ClipPath(
                    clipper: OctantCircleClipper2(),
                    child: Container(
                      width: 300,
                      height: 300,
                      color: Colors.primaries[index % Colors.primaries.length],
                      child: const Center(
                        child: Text(''),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

          ...List.generate(
            3,
            (index) => PizzaWidget(sliceCount: (index + 1) * 2)
          ),

        ],
      ),
    );
  }
}