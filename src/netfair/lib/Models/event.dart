import 'package:firebase_database/firebase_database.dart';
/*import 'package:DatabaseReference';*/

class DBEvent {
  DatabaseReference _id;
  String name;
  String description;
  String location;
  String startDate;
  String endDate;
  String startHour;
  String endHour;
  Set participants  = {};
  

  void setId(DatabaseReference id){
    this._id = id;
  }

  Map<String, dynamic> toJson() {
    return {
      'name' : this.name,
      'description' : this.description,
      'location' : this.location,
      'startDate' : this.startDate,
      'endDate' : this.endDate,
      'startHour' : this.startHour,
      'endHour' : this.endHour,
      'participants' : this.participants.toList(),
    };
  }

  DBEvent(this.name, this.description, this.location, this.startDate, this.endDate, this.startHour, this.endHour);

}