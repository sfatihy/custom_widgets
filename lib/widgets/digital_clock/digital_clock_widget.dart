import 'package:flutter/material.dart';

import 'digital_clock.dart';

class DigitalClockWidget extends StatefulWidget {
  const DigitalClockWidget({super.key});

  @override
  State<DigitalClockWidget> createState() => _DigitalClockWidgetState();
}

class _DigitalClockWidgetState extends State<DigitalClockWidget> {

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

    Index index = Index();

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
      stream: Stream.periodic(const Duration(milliseconds: 100), (count) => DateTime.now()),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
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

                time(Time.time(int.parse(snapshot.data!.hour.toString().padLeft(2, '0').split('').first))),
                const SizedBox(
                  width: 2.5,
                ),
                time(Time.time(int.parse(snapshot.data!.hour.toString().padLeft(2, '0').split('').last))),

                colon(),

                time(Time.time(int.parse(snapshot.data!.minute.toString().padLeft(2, '0').split('').first))),
                const SizedBox(
                  width: 2.5,
                ),
                time(Time.time(int.parse(snapshot.data!.minute.toString().padLeft(2, '0').split('').last))),

                colon(),

                time(Time.time(int.parse(snapshot.data!.second.toString().padLeft(2, '0').split('').first))),
                const SizedBox(
                  width: 2.5,
                ),
                time(Time.time(int.parse(snapshot.data!.second.toString().padLeft(2, '0').split('').last)))

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
