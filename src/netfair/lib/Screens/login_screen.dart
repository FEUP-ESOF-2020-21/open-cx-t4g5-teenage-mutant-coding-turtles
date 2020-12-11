import 'package:flutter/material.dart';
import '../Components/LoginForm.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(36, 36, 44, 1),
        body: ListView(
          children: [
            Image(
              image: AssetImage('assets/img/app_logo_cropped.jpg'),
              height: 380,
            ),
            LoginForm()
          ],
        ));
  }
}
