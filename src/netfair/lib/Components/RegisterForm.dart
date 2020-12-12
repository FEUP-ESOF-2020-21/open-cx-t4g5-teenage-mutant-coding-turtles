import 'package:flutter/material.dart';
import '../Decorations/text_field_decor.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _success;
  String _userEmail;

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
                /*else if ()
                 TODO: validate password
                 */
                return null; //return 'Please enter a valid password';
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 15.0, left: 70.0, right: 70.0),
            decoration: textFieldDecoration(),
            height: 50.0,
            child: TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Confirmar Password',
                  prefixIcon: Icon(Icons.vpn_key_rounded)),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter a valid password';
                }
                else if (value != _passwordController.text) {
                  return 'Password does not match!';
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
              color: Colors.blue,
              shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
              onPressed: () async {
                if (_formKey.currentState.validate()) {
                  _register();
                }
              },
              child: Text(
                "Registar",
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
              color: Colors.greenAccent,
              shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
              onPressed: () {
                Navigator.pushNamed(context, '/');
              },
              child: Text(
                "Back",
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
    // Clean up the controller when the Widget is disposed
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _register() async {
    final User user = (await _auth.createUserWithEmailAndPassword(
      email: _emailController.text,
      password: _passwordController.text,
    ))
        .user;
    if (user != null) {
      setState(() {
        _success = true;
        _userEmail = user.email;
        Navigator.popAndPushNamed(context, '/chooseUserType');
      });
    } else {
      _success = false;
    }
  }
}