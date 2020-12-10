import 'package:flutter/material.dart';
import 'package:netfair/Components/CreateProfileWizard.dart';
import 'package:netfair/Components/MyAppBar.dart';
import 'package:netfair/Components/MyBottomNavigationBar.dart';

class CreateProfileScreen extends StatefulWidget {
  @override
  _CreateProfileScreenState createState() => _CreateProfileScreenState();
}

class _CreateProfileScreenState extends State<CreateProfileScreen> {
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
              'Criar Perfil',
              style: TextStyle(
                  fontSize: 26,
                  color: Colors.white,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          CreateProfileWizard(),
        ],
      ),
      bottomNavigationBar: MyBottomNavigationBar.getBottomNavigationBar(
          _selectedIndex, _onItemTapped),
    );
  }
}
