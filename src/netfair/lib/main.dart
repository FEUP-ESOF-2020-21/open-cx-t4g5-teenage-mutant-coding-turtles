import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NetFair',
      theme: ThemeData(
        brightness: Brightness.dark, 
        ),
      home: Scaffold(
        // backgroundColor: Color.fromRGBO(12, 12, 13, 1), // TODO: Cor
        body: ListView(
          children: [
            Image(image: AssetImage(
              'assets/app_logo.jpg')
              ),
            LoginForm()
          ],
        )
      ),
    );
  }
}

// Define a custom Form widget.
class LoginForm extends StatefulWidget {
  @override
  LoginFormState createState() {
    return LoginFormState();
  }
}

// Define a corresponding State class.
// This class holds data related to the form.
class LoginFormState extends State<LoginForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Email',
              labelText: 'Email',
              prefixIcon: Icon(
                Icons.email_rounded
              )
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          TextFormField( 
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Password',
              labelText: 'Password',
              prefixIcon: Icon(
                Icons.vpn_key_rounded
              )
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
            ElevatedButton(
              onPressed: () {
                // Validate returns true if the form is valid, or false
                // otherwise.
                if (_formKey.currentState.validate()) {
                  // If the form is valid, display a Snackbar.wsd
                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text('Processing Data')));
                }
              },
              child: Text('Login'),
            ),
            ElevatedButton(
              onPressed: () {
                Scaffold.of(context)
                  .showSnackBar(SnackBar(content: Text('Redirect to Sign Up Screen')));
              },
              child: Text('Sign Up'),
            ),
          ],)
          
        ],
      ),
    );
  }
}