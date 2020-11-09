import 'package:flutter/material.dart';
import 'package:netfair/landing_screen.dart';

import 'package:netfair/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NetFair',
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        '/landing': (context) => LandingScreen()
      },
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
    );
  }
}
