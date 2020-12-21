import 'package:flutter/material.dart';
import '../Decorations/text_field_decor.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(top: 5.0, left: 70.0, right: 70.0),
            decoration: textFieldDecoration(),
            height: 50.0,
            child: TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Email',
                  prefixIcon: Icon(Icons.email_rounded)),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                } else if (RegExp(
                    r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
                    .hasMatch(
                    value)) // regex from: https://stackoverflow.com/questions/16800540/validate-email-address-in-dart
                  return null;

                return 'Enter a valid email';
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 15.0, left: 70.0, right: 70.0),
            decoration: textFieldDecoration(),
            height: 50.0,
            child: TextFormField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Password',
                  prefixIcon: Icon(Icons.vpn_key_rounded)),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter a valid password';
                }
                return null; //return 'Please enter a valid password';
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 45, right: 70, left: 70),
            height: 50,
            width: 150,
            child: RaisedButton(
              color: Colors.deepPurple,
              shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
              onPressed: () {
                // Validate returns true if the form is valid, or false
                // otherwise.
                if (_formKey.currentState.validate()) {
                  _signInWithEmailAndPassword();
                }
              },
              child: Text(
                "Login",
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20, right: 70, left: 70),
            height: 50,
            width: 150,
            child: RaisedButton(
              color: Colors.orange[700],
              shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
              onPressed: () {
                Navigator.pushNamed(context, '/register');
              },
              child: Text(
                "Register",
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _signInWithEmailAndPassword() async {
    try {
      final User user = (await _auth.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      )).user;
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text("${user.email} signed in"),
      ));
      Navigator.popAndPushNamed(context, '/landing');
    } catch (e) {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text("Failed to sign in with Email & Password"),
      ));
    }
  }

}
