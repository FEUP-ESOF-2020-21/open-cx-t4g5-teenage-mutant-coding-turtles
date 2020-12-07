import 'package:flutter/material.dart';
import 'package:netfair/landing_screen.dart';

import 'package:netfair/login_screen.dart';

import 'package:netfair/profile_screen.dart';
import 'package:netfair/sign_up_screen.dart';
import 'package:netfair/event_profile_screen.dart';

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
        '/landing': (context) => LandingScreen(),
        '/profile' : (context) => Profile(),
        '/register' : (context) => SignUpScreen(),
        '/event-profile' : (context) => EventProfile()
      },
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
    );
  }
}
