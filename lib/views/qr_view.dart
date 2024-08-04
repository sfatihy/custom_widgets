import 'package:flutter/material.dart';

import 'package:custom_widgets/clippers/fab_circle_clipper.dart';
import 'package:custom_widgets/views/qr_view_v2.dart';
import 'package:custom_widgets/widgets/buttons/colorful_button.dart';

class QrView extends StatelessWidget {
  const QrView({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        colorSchemeSeed: Colors.blueAccent,
        splashColor: Colors.blueAccent, // for bottom nav bar
        highlightColor: Colors.white.withOpacity(0.2), // for fab
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white54,
          elevation: 0,
          backgroundColor: Colors.blueAccent,
          type: BottomNavigationBarType.fixed,
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.blueAccent
        )
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('QR'),
        ),
        body: Center(
          child: ColorfulButton(
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('QR 2'),
                SizedBox(width: 4,),
                Icon(Icons.arrow_forward_outlined)
              ],
            ),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const QrViewV2())),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: 'Empty',
            ),
            // empty button for free space
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
        floatingActionButton: ClipPath(
          clipper: FabCircleClipper(),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.425,
            height: MediaQuery.of(context).size.width * 0.25,
            padding: const EdgeInsets.fromLTRB(0, 16, 0, 4),
            decoration: const BoxDecoration(
              color: Colors.blueAccent
            ),
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              child: FloatingActionButton(
                shape: const CircleBorder(),
                elevation: 0,
                child: const Icon(
                  Icons.qr_code,
                  color: Colors.white,
                  size: 32,
                ),
                onPressed: () {
                  debugPrint('fab pressed');
                },
              ),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
