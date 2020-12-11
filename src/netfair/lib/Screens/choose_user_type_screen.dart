import 'package:flutter/material.dart';

class ChooseUserTypeScreen extends StatelessWidget {
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
            Container(
              margin: const EdgeInsets.only(top: 45, right: 70, left: 70),
              height: 50,
              width: 150,
              child: RaisedButton(
                color: Colors.lightBlueAccent,
                shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                onPressed: () {
                  Navigator.pushNamed(context, '/createProfile');
                },
                child: Text(
                  "Participante",
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
                color: Colors.lightGreenAccent,
                shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                onPressed: () {
                  Navigator.pushNamed(context, '/landing');
                },
                child: Text(
                  "Empresa",
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
                color: Colors.deepPurpleAccent,
                shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                onPressed: () {
                  Navigator.pushNamed(context, '/landing');
                },
                child: Text(
                  "Organização",
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
