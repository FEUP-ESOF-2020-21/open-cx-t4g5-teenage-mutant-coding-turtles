import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(36, 36, 44, 1),
        body: ListView(
          children: [
            Image(
              image: AssetImage('assets/app_logo_cropped.jpg'),
              height: 375,
            ),
            SignUpForm()
          ],
        ));
  }
}

class SignUpForm extends StatefulWidget {
  @override
  SignUpFormState createState() {
    return SignUpFormState();
  }
}

class SignUpFormState extends State<SignUpForm> {
  final _signUpForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _signUpForm,
      child: Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Email',
                labelText: 'Email',
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
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Password',
                labelText: 'Password',
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
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Confirm Password',
                labelText: 'Confirm Password',
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.deepPurple),
                ),
                onPressed: () {
                  // Validate returns true if the form is valid, or false
                  // otherwise.
                  if (_signUpForm.currentState.validate()) {
                    // If the form is valid, display a Snackbar.wsd
                    Scaffold.of(context).showSnackBar(
                        SnackBar(content: Text('Processing Data')));
                    Navigator.pushNamed(context, '/landing');
                  }
                },
                child: Text('Sign Up'),
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.deepPurple),
                ),
                onPressed: () {
                  Scaffold.of(context).showSnackBar(
                      SnackBar(content: Text('Redirect to Sign Up Screen')));
                  Navigator.pushNamed(context, '/');
                },
                child: Text('Back to Log In'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
