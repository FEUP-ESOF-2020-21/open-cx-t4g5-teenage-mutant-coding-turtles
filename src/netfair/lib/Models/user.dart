import 'package:firebase_database/firebase_database.dart';

class DBUser {
  DatabaseReference _id;
  String name;
  String email;
  String location;
  String linkedIn;
  String workArea;
  String description;
  Set eventsEntered  = {};

  void setId(DatabaseReference id){
    this._id = id;
  }

  Map<String, dynamic> toJson() {
    return {
      'name' : this.name,
      'email' : this.email,
      'location' : this.location,
      'linkedIn' : this.linkedIn,
      'workArea' : this.workArea,
      'description' : this.description,
      'eventsEntered' : this.eventsEntered.toList(),
    };
  }

  DBUser(this.name, this.email, this.location, this.linkedIn, this.workArea,
      this.description);
}