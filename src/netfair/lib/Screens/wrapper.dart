import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:netfair/Screens/landing_screen.dart';
import 'package:netfair/Screens/login_screen.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;



class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (_auth.currentUser != null) {
      return LandingScreen();
    } else return LoginScreen();

  }
}