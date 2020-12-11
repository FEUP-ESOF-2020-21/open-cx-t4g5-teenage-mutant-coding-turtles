import 'package:flutter/material.dart';
import 'Screens/choose_user_type_screen.dart';
import 'Screens/create_event_screen.dart';
import 'Screens/create_profile_screen.dart';
import 'Screens/event_profile_screen.dart';
import 'Screens/landing_screen.dart';
import 'Screens/login_screen.dart';
import 'Screens/profile_screen.dart';
import 'Screens/sign_up_screen.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NetFair',
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        '/landing': (context) => LandingScreen(),
        '/profile' : (context) => ProfileScreen(),
        '/register' : (context) => SignUpScreen(),
        '/createEvent' : (context) => CreateEventScreen(),
        '/event-profile' : (context) => EventScreen(),
        '/createProfile' : (context) => CreateProfileScreen(),
        '/chooseUserType' : (context) => ChooseUserTypeScreen(),
      },
      theme: ThemeData(
        fontFamily: 'Comfortaa',
        brightness: Brightness.dark,
      ),
    );
  }
}
