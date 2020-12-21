import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netfair/Models/database.dart';
import 'package:netfair/Models/user.dart';
import '../Decorations/text_field_decor.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class CreateProfileWizard extends StatefulWidget {
  @override
  _CreateProfileWizardState createState() {
    return _CreateProfileWizardState();
  }
}

class _CreateProfileWizardState extends State<CreateProfileWizard> {
  int currentStep = 0;
  bool complete = false;

  String dropdownValue = "Área de trabalho";
  String dropdownValueAno = "Ano";

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _linkedInController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _academicsController = TextEditingController();

  bool fullTimeCheck = false;
  bool partTimeCheck = false;
  bool estagioCheck = false;
  bool concluidoCheck = false;

  List<String> sectors = [
    "Área de trabalho",
    "IT",
    "Marketing",
    "Design",
    "Gestão",
    "RH",
    "Economia",
    "Medicina",
    "Farmácia",
    "Biologia"
  ];

  List<String> anos = [
    "Ano",
    "1",
    "2",
    "3",
    "4",
    "5",
    "6"
  ];

  next(){
    if (currentStep + 1 != steps.length){
      goTo(currentStep + 1);
    } else {
      newUser();
      setState(() => complete = true);
    }
  }

  goTo(int step){
    setState(() => currentStep = step);
  }

  cancel(){
    if (currentStep > 0){
      goTo(currentStep - 1);
    }
  }

  StepState getState(int i) {
    if (currentStep >= i)
      return StepState.complete;
    else
      return StepState.indexed;
  }

  bool getActive(int i) {
    return currentStep == (i - 1);
  }

  List<Step> steps = <Step>[];

  List<Step> getSteps(BuildContext context){
    steps = <Step>[
      Step(
          title: const Text("Novo Utilizador"),
          isActive: getActive(1),
          state: getState(1),
          content: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 10.0),
                decoration: textFieldDecoration(),
                height: 50.0,
                child: TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Nome',
                      prefixIcon: Icon(Icons.event)
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20.0),
                decoration: textFieldDecoration(),
                height: 50.0,
                child: TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Email',
                      prefixIcon: Icon(Icons.event)
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    } else if (RegExp(
                        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
                        .hasMatch(
                        value))
                      return null;

                    return 'Enter a valid email';
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20.0),
                decoration: textFieldDecoration(),
                height: 50.0,
                child: TextFormField(
                  controller: _linkedInController,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'LinkedIn',
                      prefixIcon: Icon(Icons.event)
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20.0),
                height: 50.0,
                width: 300,
                child: DropdownButton<String>(
                  value: dropdownValue,
                  icon: Icon(Icons.arrow_drop_down),
                  iconSize: 16,
                  elevation: 16,
                  style: TextStyle(
                    color: Colors.white70,
                    height: 2,
                  ),
                  onChanged: (String newValue) {
                    setState(() {
                      dropdownValue = newValue;
                    });
                  },
                  items: sectors.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList()
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20.0),
                decoration: textFieldDecoration(),
                height: 50.0,
                child: TextFormField(
                  controller: _locationController,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Localização',
                      prefixIcon: Icon(Icons.location_pin)
                  ),
                ),
              ),
            ],
          )
      ),
      Step(
          title: const Text("Foto de Perfil"),
          isActive: getActive(2),
          state: getState(2),
          content: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 10.0),
                decoration: textFieldDecoration(),
                height: 50.0,
                child: RaisedButton.icon(
                  color: Colors.black26,
                  shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10.0)),
                  onPressed: () {
                    // TODO upload file logic
                  },
                  label: Text(
                    "Carregar foto de perfil",
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                  icon: Icon(
                      Icons.upload_rounded,
                      color: Colors.white70
                  ),
                ),
              ),
            ],
          )
      ),
      Step(
        title: const Text("Área Privada"),
        isActive: getActive(3),
        state: getState(3),
        content: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 10.0),
              decoration: textFieldDecoration(),
              height: 200.0,
              child: TextFormField(
                controller: _descriptionController,
                maxLines: 8,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Apresentação',
                    prefixIcon: Icon(Icons.account_box_outlined)
                ),
              ),
            ),
            Container(
                margin: const EdgeInsets.only(top: 30.0),
                height: 20.0,
                width: 300,
                child: Text(
                  "Disponível para:",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 16.0,
                  )
                ),
            ),
            Container(
              height: 100.0,
              width: 300,
              child: Row(
                children: [
                  Container(
                      width: 100,
                      margin: const  EdgeInsets.only(right: 5.0),
                      child: Column(
                        children: [
                          Checkbox(
                            checkColor: Colors.greenAccent,
                            activeColor: Colors.red,
                            value: fullTimeCheck,
                            onChanged: (bool value) {
                              setState(() {
                                fullTimeCheck = value;
                              });
                            },
                          ),
                          Text(
                              "Full-time",
                              style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 14.0
                              )
                          )
                        ],
                      )
                  ),
                  Container(
                      width: 100,
                      margin: const  EdgeInsets.only(right: 5.0),
                      child: Column(
                        children: [
                          Checkbox(
                            checkColor: Colors.greenAccent,
                            activeColor: Colors.red,
                            value: partTimeCheck,
                            onChanged: (bool value) {
                              setState(() {
                                partTimeCheck = value;
                              });
                            },
                          ),
                          Text(
                              "Part-time",
                              style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 14.0
                              )
                          )
                        ],
                      )
                  ),
                  Container(
                      width: 80,
                      margin: const  EdgeInsets.only(right: 5.0),
                      child: Column(
                        children: [
                          Checkbox(
                            checkColor: Colors.greenAccent,
                            activeColor: Colors.red,
                            value: estagioCheck,
                            onChanged: (bool value) {
                              setState(() {
                                estagioCheck = value;
                              });
                            },
                          ),
                          Text(
                              "Estágio",
                              style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 14.0
                              )
                          )
                        ],
                      )
                  ),
                ],
              )
            ),
            Container(
              decoration: textFieldDecoration(),
              height: 50.0,
              child: TextFormField(
                controller: _academicsController,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Formação académica',
                    prefixIcon: Icon(Icons.school_sharp)
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20.0),
              height: 50.0,
              child: Row(
                children: [
                  Container(
                    width: 100,
                    child: DropdownButton<String>(
                        value: dropdownValueAno,
                        icon: Icon(Icons.arrow_drop_down),
                        iconSize: 16,
                        elevation: 16,
                        style: TextStyle(
                          color: Colors.white70,
                          height: 2,
                        ),
                        onChanged: (String newValue) {
                          setState(() {
                            dropdownValueAno = newValue;
                          });
                        },
                        items: anos.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList()
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 50.0),
                    child: Row(
                      children: [
                        Checkbox(
                          checkColor: Colors.greenAccent,
                          activeColor: Colors.red,
                          value: concluidoCheck,
                          onChanged: (bool value) {
                            setState(() {
                              concluidoCheck = value;
                            });
                          },
                        ),
                        Text(
                            "Concluído",
                            style: TextStyle(
                                color: Colors.white70,
                                fontSize: 14.0
                            )
                        )
                      ],
                    )
                  )
                ],
              )
            ),
          ],
        ),
      ),
    ];

    return steps;
  }

  void newUser(){
    DBUser user = new DBUser(_nameController.text, _emailController.text, _locationController.text, _linkedInController.text, dropdownValue, _descriptionController.text, partTimeCheck, fullTimeCheck, estagioCheck, _academicsController.text, dropdownValueAno, concluidoCheck);
    user.setId(saveUser(user));
  }

  @override
  Widget build(BuildContext context){
    return complete ? Expanded(
        child: Center(
            child: AlertDialog(
                title: Text("Perfil criado com sucesso!"),
                content: Text(""),
                actions: <Widget>[
                  FlatButton(
                      child: Text("Ok"),
                      onPressed: (){
                        setState(() => complete = false);
                        Navigator.pushNamed(context, '/landing');
                      }
                  )
                ]
            )
        )
    )
        : Expanded(
        child: Stepper(
          steps: getSteps(context),
          type: StepperType.vertical,
          currentStep: currentStep,
          onStepContinue: next,
          onStepCancel: cancel,
          onStepTapped: (step) => goTo(step),
        )
    );
  }
}