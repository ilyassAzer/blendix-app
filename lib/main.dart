// * Packages
import 'package:app/screens/NavigationScreen.dart';
import 'package:flutter/material.dart';

// * Screens
import 'screens/NavigationScreen.dart';


void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Blendix',
      home: NavigationScreen(),
    );
  }
}
