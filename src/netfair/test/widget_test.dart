// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:netfair/Models/user.dart';

import 'package:netfair/main.dart';

void main() {
  test('User should be created and parsed to a JSON', () {
      final user = DBUser('Joaquim', 'joaquim21@gmail.com', 'Porto', 'linkedIn', 'Design', 'Sou o Joaquim, gosto de design e de testes', false, true, false, 'Escola de Design do Porto', '3', true);
      expect(user.toJson(), {
        "name": "Joaquim",
        "email": "joaquim21@gmail.com",
        "location": "Porto",
        "linkedIn": "linkedIn",
        "workArea": "Design",
        "description": "Sou o Joaquim, gosto de design e de testes",
        "partTimeAvailability": false,
        "fullTimeAvailability": true,
        "internshipAvailability": false,
        "academics": "Escola de Design do Porto",
        "academicsYear": "3",
        "concludedStudies": true,
        "eventsEntered": []
      });
  });
}
