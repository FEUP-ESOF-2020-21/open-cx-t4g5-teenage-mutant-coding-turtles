import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../Components/MyAppBar.dart';
import '../Components/MyBottomNavigationBar.dart';


class EventScreen extends StatefulWidget {
  @override
  _EventScreenState createState() => _EventScreenState();
}


class _EventScreenState extends State<EventScreen> {

  int _selectedIndex = 2;

  void _onItemTapped(int index){
    setState((){
      _selectedIndex = index;
    });
  }

  var eventName = 'FEUP Carrer Fair';
  var eventImage = 'assets/img/events/feupcarrerfair.jpg';
  var eventLink = 'https://paginas.fe.up.pt/~careerf20/';
  var eventStartDate = '14/10';
  var eventEndDate = '16/10';
  var eventStartHour = '10:00';
  var evenLocation = 'Online';
  var eventDescription = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.';

  launchURL() {
    launch(eventLink);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(36, 36, 44, 1),
      appBar: MyAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Image(
                  image: AssetImage(eventImage),
                  height: 200
              ),
              SizedBox(height: 5.0),
              Row(
                children: <Widget>[
                  Expanded(child: Text(
                    eventName,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.0,
                      letterSpacing: 1.0,
                    ),
                  )
                  ),
                  SizedBox(width: 20.0),
                  ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.deepPurple),
                      ),
                      onPressed: launchURL,
                      child: Icon(
                        Icons.link,
                        color: Colors.grey[400],
                      ))
                ],
              ),
              SizedBox(height: 20.0),
              Row(
                children: <Widget>[
                  Icon(
                    Icons.calendar_today_rounded,
                    color: Colors.grey[400],
                  ),
                  SizedBox(width: 20.0),
                  Expanded(child: Text(
                    eventStartDate + ' - ' + eventEndDate,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                      letterSpacing: 1.0,
                    ),
                  )
                  )
                ],
              ),
              SizedBox(height: 20.0),
              Row(
                children: <Widget>[
                  Icon(
                    Icons.access_time,
                    color: Colors.grey[400],
                  ),
                  SizedBox(width: 20.0),
                  Expanded(child: Text(
                    'Event starts at ' + eventStartHour,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                      letterSpacing: 1.0,
                    ),
                  )
                  )
                ],
              ),
              SizedBox(height: 20.0),
              Row(
                children: <Widget>[
                  Icon(
                    Icons.location_on,
                    color: Colors.grey[400],
                  ),
                  SizedBox(width: 20.0),
                  Text(
                    evenLocation,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                      letterSpacing: 1.0,
                    ),
                  )
                ],
              ),
              SizedBox(height: 20.0),
              Row(
                children: <Widget>[
                  Expanded(child: Text(
                    eventDescription,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                      letterSpacing: 1.0,
                    ),
                  )
                  )
                ],
              ),
              SizedBox(height: 20.0),
              Center(
                  child:
                  ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.deepPurple),
                      ),
                      onPressed: null,
                      child: Text('Enter'))
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: MyBottomNavigationBar.getBottomNavigationBar(_selectedIndex, _onItemTapped),
    );
  }
}