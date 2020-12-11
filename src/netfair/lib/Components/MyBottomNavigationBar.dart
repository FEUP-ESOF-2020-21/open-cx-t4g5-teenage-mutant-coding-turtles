import 'package:flutter/material.dart';

class MyBottomNavigationBar  {

  static getBottomNavigationBar(int _selectedIndex, Function(int) _onItemTapped){
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(
              Icons.home,
              color: Colors.white70,
          ),
          backgroundColor: Colors.lightBlueAccent,
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(
              Icons.search,
              color: Colors.white70,
          ),
          backgroundColor: Colors.orangeAccent,
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(
              Icons.calendar_today,
              color: Colors.white70,
          ),
          backgroundColor: Colors.purple,
          label: 'Calendar',
        ),
        BottomNavigationBarItem(
          icon: Icon(
              Icons.person,
              color: Colors.white70,
          ),
          backgroundColor: Colors.lightGreenAccent,
          label: 'Profile',
        ),
        BottomNavigationBarItem(
          icon: Icon(
              Icons.settings,
              color: Colors.white70,
          ),
          backgroundColor: Colors.redAccent,
          label: 'Settings',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.white70,
      onTap: _onItemTapped,
    );
  }
}