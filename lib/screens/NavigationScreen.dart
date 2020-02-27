// * Packages
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// * Screens
import 'package:app/screens/HomeScreen.dart';
import 'package:app/screens/List/ListScreen.dart';
import 'package:app/screens/ProfileScreen.dart';
import 'Blends/BlendScreen.dart';

// * Blocs
import 'package:app/blocs/NavigationManager.dart';
import 'package:app/blocs/Provider.dart';

class NavigationScreen extends StatefulWidget {
  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  final navigationManager = $Provider.of<NavigationManager>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: StreamBuilder(
        stream: navigationManager.indexStream,
        initialData: 0,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return [HomeScreen(), ListScreen(), BlendScreen(), ProfileScreen()]
              .elementAt(snapshot.data);
        },
      ),
      bottomNavigationBar: StreamBuilder<int>(
          initialData: 0,
          stream: navigationManager.indexStream,
          builder: (context, snapshot) {
            return BottomNavigationBar(
              currentIndex: snapshot.data,
              onTap: (int index) {
                navigationManager.selectedIndex(index);
              },
              selectedItemColor: Colors.black,
              unselectedItemColor: Colors.grey,
              selectedIconTheme: IconThemeData(size: 24),
              unselectedIconTheme: IconThemeData(size: 20),
              elevation: 0,
              backgroundColor: Colors.white,
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.houzz),
                  title: Container(),
                ),
                BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.stream),
                  title: Container(),
                ),
                BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.mortarPestle),
                  title: Container(),
                ),
                BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.userAlt),
                  title: Container(),
                ),
              ],
            );
          }),
    );
  }

  @override
  void dispose() {
    super.dispose();
    navigationManager.dispose();
  }
}
