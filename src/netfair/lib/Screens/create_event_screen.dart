import 'package:flutter/material.dart';
import 'package:netfair/Components/CreateEventWizard.dart';
import 'package:netfair/Components/MyAppBar.dart';
import 'package:netfair/Components/MyBottomNavigationBar.dart';

class CreateEventScreen extends StatefulWidget {
  @override
  _CreateEventScreenState createState() => _CreateEventScreenState();
}

class _CreateEventScreenState extends State<CreateEventScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      backgroundColor: Color.fromRGBO(36, 36, 44, 1),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              'Criar Evento',
              style: TextStyle(
                fontSize: 26,
                color: Colors.white,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          CreateEventWizard(),
        ],
      ),
      bottomNavigationBar: MyBottomNavigationBar.getBottomNavigationBar(
          _selectedIndex, _onItemTapped),
    );
  }
}
