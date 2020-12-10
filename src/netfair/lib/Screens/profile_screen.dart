import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Components/MyAppBar.dart';
import '../Components/MyAppBar.dart';
import '../Components/MyBottomNavigationBar.dart';


class ProfileScreen extends StatefulWidget {

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}


class _ProfileScreenState extends State<ProfileScreen> {
  int _selectedIndex = 3;

  void _onItemTapped(int index){
    setState((){
      _selectedIndex = index;
    });
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
              Center(
                child: CircleAvatar(
                  radius: 40.0,
                  backgroundImage: AssetImage('assets/img/users/terryCrews.jpg'),
                ),
              ),
              Divider(
                color: Colors.grey[800],
                height: 60.0,
              ),
              Center(
                child: Text(
                  'Terry Crews',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.0,
                    letterSpacing: 2.0,
                  ),
                ),
              ),
              SizedBox(height: 5.0),
              Center(
                child: Text(
                  'Porto, Portugal',
                  style: TextStyle(
                    color: Colors.white,
                    letterSpacing: 2.0,
                  ),
                ),
              ),

              SizedBox(height: 20.0),
              Row(
                children: <Widget>[
                  Icon(
                    Icons.indeterminate_check_box_rounded,
                    color: Colors.grey[400],
                  ),
                  SizedBox(width: 20.0),
                  Expanded(child: Text(
                      'linkedin? search me on google',
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
                    Icons.email,
                    color: Colors.grey[400],
                  ),
                  SizedBox(width: 20.0),
                  Expanded(child: Text(
                      'terry_best_ever_crews@gmail.com',
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
                    Icons.work,
                    color: Colors.grey[400],
                  ),
                  SizedBox(width: 20.0),
                  Text(
                    'Best actor ever',
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
                  Icon(
                    Icons.school_sharp,
                    color: Colors.grey[400],
                  ),
                  SizedBox(width: 20.0),
                  Text(
                    'FEUP MIEIC',
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
                  Icon(
                    Icons.perm_identity,
                    color: Colors.grey[400],
                  ),
                  SizedBox(width: 20.0),
                  Expanded(child: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                      letterSpacing: 1.0,
                    ),
                  )
                  )
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: MyBottomNavigationBar.getBottomNavigationBar(_selectedIndex, _onItemTapped),
    );
  }
}
