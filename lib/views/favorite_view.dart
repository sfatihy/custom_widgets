import 'package:flutter/material.dart';

import 'package:custom_widgets/clippers/fab_favorite_clipper.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

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
          title: const Text('Favorite'),
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
          clipper: FabFavoriteClipper(),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.425,
            height: MediaQuery.of(context).size.width * 0.3,
            padding: const EdgeInsets.fromLTRB(0, 16, 0, 4),
            decoration: const BoxDecoration(
              color: Colors.blueAccent
            ),
            child: FloatingActionButton(
              shape: const CircleBorder(),
              elevation: 0,
              child: const Icon(
                Icons.favorite,
                color: Colors.white,
                size: 32,
              ),
              onPressed: () {
                debugPrint('fab pressed');
              },
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
