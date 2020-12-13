import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:netfair/Models/event.dart';
import 'user.dart';

final databaseReference = FirebaseDatabase.instance.reference();
final FirebaseAuth _auth = FirebaseAuth.instance;

DatabaseReference saveUser(DBUser user) {
  var id = databaseReference.child('users/'+ _auth.currentUser.uid);
  id.set(user.toJson());
  return id;
}

DatabaseReference saveEvent(DBEvent event) {
  var id = databaseReference.child('events/').push();
  id.set(event.toJson());
  return id;
}