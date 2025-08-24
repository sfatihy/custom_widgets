import 'package:flutter/material.dart';

import 'digital_clock.dart';

class DigitalClockWidget extends StatefulWidget {
  const DigitalClockWidget({super.key});

  @override
  State<DigitalClockWidget> createState() => _DigitalClockWidgetState();
}

class _DigitalClockWidgetState extends State<DigitalClockWidget> {

  Index index = Index();

  Widget colon() {
    return SizedBox(
      width: 15,
      child: Column(
        children: [
          Container(
            height: 7.5,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            height: 7.5,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle
            ),
          )
        ],
      ),
    );
  }

  Widget time (Time time) {
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

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DateTime>(
      stream: Stream.periodic(const Duration(milliseconds: 500), (count) => DateTime.now()),
      builder: (context, snapshot) {
        if (snapshot.hasData) {

          final now = snapshot.data!;
          final hourStr = now.hour.toString().padLeft(2, '0');
          final minuteStr = now.minute.toString().padLeft(2, '0');
          final secondStr = now.second.toString().padLeft(2, '0');

          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.centerRight,
                colors: Colors.primaries.sublist(5,8),
                stops: const [0.25,0.5,1]
              ),
              border: Border.all(
                color: Colors.white30,
                width: 5,
              ),
              borderRadius: BorderRadius.circular(12),
              boxShadow: const [
                BoxShadow(
                  color: Color(0xFF8AECFF),
                  offset: Offset(-5, 5)
                )
              ]
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 8
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [

                time(Time.time(int.parse(hourStr[0]))),
                const SizedBox(
                  width: 2.5,
                ),
                time(Time.time(int.parse(hourStr[1]))),

                colon(),

                time(Time.time(int.parse(minuteStr[0]))),
                const SizedBox(
                  width: 2.5,
                ),
                time(Time.time(int.parse(minuteStr[1]))),

                colon(),

                time(Time.time(int.parse(secondStr[0]))),
                const SizedBox(
                  width: 2.5,
                ),
                time(Time.time(int.parse(secondStr[1])))

              ],
            ),
          );
        }
        else {
          return const Center(
            child: CircularProgressIndicator()
          );
        }
      }
    );
  }
}
