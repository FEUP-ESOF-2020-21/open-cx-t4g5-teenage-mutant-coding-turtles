import 'package:flutter/material.dart';
import 'file:///C:/Workspace/Feup/ESOF/repo/src/netfair/lib/Screens/create_event_screen.dart';
import 'file:///C:/Workspace/Feup/ESOF/repo/src/netfair/lib/Screens/landing_screen.dart';
import 'file:///C:/Workspace/Feup/ESOF/repo/src/netfair/lib/Screens/login_screen.dart';
import 'file:///C:/Workspace/Feup/ESOF/repo/src/netfair/lib/Screens/profile_screen.dart';
import 'file:///C:/Workspace/Feup/ESOF/repo/src/netfair/lib/Screens/sign_up_screen.dart';
import 'file:///C:/Workspace/Feup/ESOF/repo/src/netfair/lib/Screens/event_profile_screen.dart';
import 'file:///C:/Workspace/Feup/ESOF/repo/src/netfair/lib/Screens/create_profile_screen.dart';
import 'file:///C:/Workspace/Feup/ESOF/repo/src/netfair/lib/Screens/choose_user_type_screen.dart';


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
