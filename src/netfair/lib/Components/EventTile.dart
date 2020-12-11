import 'dart:ui';
import 'package:flutter/material.dart';

class EventTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5.0, bottom: 20.0),
      child:
        Column(
          children: [
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 5.0),
                  height: 25,
                  width: 25,
                  child: Image(
                      image: AssetImage('assets/img/app_logo.png'),
                      height: 40
                  ),
                ),
                Container(
                  height: 40,
                  width: 150,
                  margin: const EdgeInsets.only(left: 20.0),
                  padding: const EdgeInsets.only(top: 12.0),
                  child: Text(
                    "Event Organizer",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.white70,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                ),
                Container(
                  height: 40,
                  width: 40,
                  margin: const EdgeInsets.only(left: 140.0),
                  child: IconButton(
                    icon: Icon(Icons.more_vert),
                    color: Colors.white70,
                    onPressed: () {
                      // TODO more button handler
                    },
                  ),
                )
              ],
            ),
            Image(
                image: AssetImage('assets/img/events/feupcarrerfair.jpg'),
                height: 200),
            Row(
              children: [
                Container(
                  height: 180,
                  width: 392,
                  padding: const EdgeInsets.only(top: 20, bottom: 20),
                  color: Color.fromRGBO(234, 234, 234, 0.8),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 60,
                                    height: 20,
                                    margin: const EdgeInsets.only(right: 20, left: 20),
                                    child: Text(
                                      "MON",
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        color: Colors.redAccent
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    width: 60,
                                    height: 20,
                                    child: Text(
                                      "DAY",
                                      style: TextStyle(
                                          fontSize: 20.0,
                                          color: Colors.black45
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 150,
                                    height: 25,
                                    margin: const EdgeInsets.only(left: 20.0),
                                    child: Text(
                                      "Event Title",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontSize: 24.0,
                                          color: Colors.black45,
                                          fontWeight: FontWeight.w500
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    width: 150,
                                    height: 20,
                                    margin: const EdgeInsets.only(top: 15.0, left: 25.0),
                                    child: Text(
                                      "WeekDay Time",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          color: Colors.black45
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    height: 20,
                                    margin: const EdgeInsets.only(top: 5.0, right: 5.0),
                                    child: Icon(
                                      Icons.location_pin,
                                      color: Colors.black45,
                                      size: 16.0
                                    ),
                                  ),
                                  Container(
                                    width: 100,
                                    height: 20,
                                    margin: const EdgeInsets.only(top: 5.0),
                                    child: Text(
                                      "location",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          color: Colors.black45,
                                          fontWeight: FontWeight.w500
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(left: 60.0),
                                    child: IconButton(
                                      icon: Icon(Icons.share),
                                      color: Colors.black45,
                                      onPressed: () {
                                        // TODO share button handler
                                      },
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 20.0, right: 10.0, left: 60.0),
                            height: 35,
                            width: 150,
                            child: RaisedButton(
                              color: Colors.orange[600],
                              shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                              onPressed: () {
                                Scaffold.of(context).showSnackBar(
                                    SnackBar(content: Text('Redirected to event details')));
                                Navigator.pushNamed(context, '/event-profile');
                              },
                              child: Text(
                                "Ver detalhes",
                                style: TextStyle(
                                  fontSize: 16.0,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 20.0, right: 5, left: 10),
                            height: 35,
                            width: 90,
                            child: RaisedButton(
                              color: Colors.orange[600],
                              shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                              onPressed: () {
                                Scaffold.of(context).showSnackBar(
                                    SnackBar(content: Text('Redirected to profile')));
                                Navigator.pushNamed(context, '/profile');
                              },
                              child: Text(
                                "Entrar",
                                style: TextStyle(
                                  fontSize: 16.0,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
        ])
    );
  }
}
