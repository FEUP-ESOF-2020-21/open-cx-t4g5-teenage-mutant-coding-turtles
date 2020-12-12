import 'package:flutter/material.dart';
import '../Components/EventTile.dart';
import '../Components/MyAppBar.dart';
import '../Components/MyBottomNavigationBar.dart';

class LandingScreen extends StatefulWidget {

  @override
  _LandingScreenState createState() => _LandingScreenState();
}


class _LandingScreenState extends State<LandingScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index){
    setState((){
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(),
        backgroundColor: Color.fromRGBO(36, 36, 44, 1),
        body: ListView(
          children: [
            EventTile(),
            EventTile(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/');
          },
          backgroundColor: Colors.greenAccent,
          splashColor: Colors.pinkAccent,
          child: Icon(
            Icons.add,
            color: Colors.white70,
          ),
        ),
        bottomNavigationBar: MyBottomNavigationBar.getBottomNavigationBar(_selectedIndex, _onItemTapped),
    );
  }
}




