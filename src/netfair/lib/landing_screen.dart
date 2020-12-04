import 'package:flutter/material.dart';

class LandingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(36, 36, 44, 1),
      body: ListView(
        children: [
          EventTile(),
          EventTile(),
          ElevatedButton(
            onPressed: () {
              // Navigate back to first screen when tapped.
              Navigator.pop(context);
            },
            child: Text('Go back!'),
          ),
          
        ],
      ),
    );
  }
}

class EventTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        children: [
          Image(image: AssetImage('assets/app_logo_cropped.jpg'), height: 50),
          Text('Event Organizer'),
        ],
      ),
      Image(image: AssetImage('assets/app_logo.jpg'), height: 200),
      Row(
        children: [
          Text('DATE   '),
          Text('Event Title'),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.deepPurple),
              ),
              onPressed: null,
              child: Text('Details')),
          ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.deepPurple),
              ),
              onPressed: null,
              child: Text('Details'))
        ],
      )
    ]);
  }
}
