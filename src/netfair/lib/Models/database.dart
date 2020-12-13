import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'user.dart';

final databaseReference = FirebaseDatabase.instance.reference();
final FirebaseAuth _auth = FirebaseAuth.instance;

DatabaseReference saveUser(DBUser user) {
  var id = databaseReference.child('users/'+ _auth.currentUser.uid);
  id.set(user.toJson());
  return id;
}