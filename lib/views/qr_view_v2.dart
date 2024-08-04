import 'package:flutter/material.dart';

import 'package:custom_widgets/clippers/fab_circle_clipper.dart';
import 'package:custom_widgets/painters/fab_circle_painter.dart';

class QrViewV2 extends StatelessWidget {
  const QrViewV2({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        colorSchemeSeed: Colors.blueAccent,
        splashColor: Colors.white, // for bottom nav bar
        highlightColor: Colors.blueAccent.withOpacity(0.1), // for fab
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.blueAccent,
          elevation: 0,
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.white
        )
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('QR V2'),
        ),
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            border: BorderDirectional(
              top: BorderSide(
                color: Colors.blueAccent,
                width: 1
              )
            )
          ),
          child: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.add),
                label: 'Empty',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.accessibility),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.remove),
                label: 'Empty',
              )
            ],
            currentIndex: 0,
            onTap: (value) {
              value != 1 ? debugPrint('tapped $value. bnb button') : null;
            },
          ),
        ),
        floatingActionButton: CustomPaint(
          painter: FabCirclePainter(
            boxShadows: const [
              BoxShadow(
                color: Colors.blueAccent,
                offset: Offset(0.0, -1.0),
              )
            ],
            clipper: FabCircleClipper()
          ),
          child: ClipPath(
            clipper: FabCircleClipper(),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.425,
              height: MediaQuery.of(context).size.width * 0.25,
              padding: const EdgeInsets.fromLTRB(0, 16, 0, 4),
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.blueAccent.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
                child: FloatingActionButton(
                  shape: const CircleBorder(),
                  elevation: 0,
                  child: const Icon(
                    Icons.qr_code,
                    size: 32,
                    color: Colors.blueAccent,
                  ),
                  onPressed: () {
                    debugPrint('fab pressed');
                  },
                ),
              ),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
