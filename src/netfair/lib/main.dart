import 'package:flutter/material.dart';
import 'package:netfair/Screens/wrapper.dart';
import 'Screens/choose_user_type_screen.dart';
import 'Screens/create_event_screen.dart';
import 'Screens/create_profile_screen.dart';
import 'Screens/event_profile_screen.dart';
import 'Screens/landing_screen.dart';
import 'Screens/login_screen.dart';
import 'Screens/profile_screen.dart';
import 'Screens/sign_up_screen.dart';

import 'package:firebase_core/firebase_core.dart';

void main() {
  runApp(App());
}

class App extends StatefulWidget {
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  // Set default `_initialized` and `_error` state to false
  bool _initialized = false;
  bool _error = false;

  // Define an async function to initialize FlutterFire
  void initializeFlutterFire() async {
    try {
      // Wait for Firebase to initialize and set `_initialized` state to true
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch(e) {
      // Set `_error` state to true if Firebase initialization fails
      setState(() {
        _error = true;
      });
    }
  }

  @override
  void initState() {
    initializeFlutterFire();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    // Show error message if initialization failed
    if(_error) {
      return Row(children: [Text('Error')],);
    }

    // Show a loader until FlutterFire is initialized
    if (!_initialized) {
      return Row(children: [Text('Loading')],);
    }

    return MyApp();
  }

}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NetFair',
      home: Wrapper(),
      routes: {
        '/login': (context) => LoginScreen(),
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
