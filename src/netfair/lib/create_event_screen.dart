import 'package:flutter/material.dart';

class CreateEventScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(36, 36, 44, 1),
        body: ListView(
          children: [
            CreateEventForm()
          ],
        ));
  }
}

class CreateEventForm extends StatefulWidget {
  @override
  CreateEventFormState createState() {
    return CreateEventFormState();
  }
}

class CreateEventFormState extends State<CreateEventForm> {
  final _createEventFormForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Padding(child:
        DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
                width: 1,
                color: Colors.black
            )
          ),
          child: Form(
            key: _createEventFormForm,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                    fillColor: Colors.black,
                    labelText: 'Event Name'
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                      fillColor: Colors.black,
                      labelText: 'Event Location'
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      // Validate returns true if the form is valid, or false
                      // otherwise.
                      if (_createEventFormForm.currentState.validate()) {
                        // If the form is valid, display a Snackbar.
                        Scaffold.of(context)
                            .showSnackBar(SnackBar(content: Text('Processing Data')));
                      }
                    },
                    child: Text('Submit'),
                  ),
                ),
              ],
            ),
        )
      ),
      padding: EdgeInsets.all(20.0),
    );
  }
}
