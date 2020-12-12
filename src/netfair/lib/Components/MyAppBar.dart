import 'dart:io';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class MyAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(Platform.isIOS ? 64 : 56);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Container(
          child: Row(
        children: [
          Container(
            width: 30,
            height: 30,
            child:
                Image(image: AssetImage('assets/img/app_logo.png'), height: 40),
          ),
          Container(
            margin: const EdgeInsets.only(left: 30),
            child: const Text('netfair'),
          ),
        ],
      )),
      actions: [
        IconButton(icon: Icon(Icons.logout), onPressed: () => {
          _auth.signOut(),Navigator.popAndPushNamed(context, '/login')
        })
      ],
    );
  }
}
