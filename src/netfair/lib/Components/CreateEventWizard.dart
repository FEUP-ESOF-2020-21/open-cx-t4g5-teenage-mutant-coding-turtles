import 'package:flutter/material.dart';
import '../Decorations/text_field_decor.dart';
import '../Components/MyTextFieldDatePicker.dart';


class CreateEventWizard extends StatefulWidget {
  @override
  _CreateEventWizardState createState() {
    return _CreateEventWizardState();
  }
}

class _CreateEventWizardState extends State<CreateEventWizard> {
  int currentStep = 0;
  bool complete = false;

  next(){
    if (currentStep + 1 != steps.length){
      goTo(currentStep + 1);
    } else {
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
          title: const Text("Novo Evento"),
          isActive: getActive(1),
          state: getState(1),
          content: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 10.0),
                decoration: textFieldDecoration(),
                height: 50.0,
                child: TextFormField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Nome',
                      prefixIcon: Icon(Icons.event)
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10.0),
                decoration: textFieldDecoration(),
                height: 200.0,
                child: TextFormField(
                  maxLines: 8,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Descrição',
                      prefixIcon: Icon(Icons.info)
                  ),
                ),
              ),
            ],
          )
      ),
      Step(
        title: const Text("Informação do Evento"),
        isActive: getActive(2),
        state: getState(2),
        content: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 10.0),
              decoration: textFieldDecoration(),
              height: 50.0,
              child: TextFormField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Localização',
                    prefixIcon: Icon(Icons.location_pin)
                ),
              ),
            ),
            Container(
                margin: const EdgeInsets.only(top: 10.0),
                height: 50.0,
                child: MyTextFieldDatePicker(
                  labelText: "Data de Início",
                  prefixIcon: Icon(Icons.date_range),
                  suffixIcon: Icon(Icons.arrow_drop_down),
                  lastDate: DateTime.now().add(Duration(days: 366)),
                  firstDate: DateTime.now(),
                  initialDate: DateTime.now().add(Duration(days: 1)),
                  onDateChanged: (selectedDate){

                  },
                )
            ),
            Container(
                margin: const EdgeInsets.only(top: 10.0),
                height: 50.0,
                child: MyTextFieldDatePicker(
                  labelText: "Data de Fim",
                  prefixIcon: Icon(Icons.date_range),
                  suffixIcon: Icon(Icons.arrow_drop_down),
                  lastDate: DateTime.now().add(Duration(days: 366)),
                  firstDate: DateTime.now(),
                  initialDate: DateTime.now().add(Duration(days: 1)),
                  onDateChanged: (selectedDate){

                  },
                )
            ),
            Container(
              margin: const EdgeInsets.only(top: 10.0),
              decoration: textFieldDecoration(),
              height: 50.0,
              child: TextFormField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Hora de Início',
                    prefixIcon: Icon(Icons.watch_later_outlined)
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10.0),
              decoration: textFieldDecoration(),
              height: 50.0,
              child: TextFormField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Hora de Fim',
                    prefixIcon: Icon(Icons.watch_later_outlined)
                ),
              ),
            ),
          ],
        ),
      ),
      Step(
          title: const Text("Foto de Capa"),
          isActive: getActive(3),
          state: getState(3),
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
                    "carregar foto de capa",
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
    ];

    return steps;
  }

  @override
  Widget build(BuildContext context){
    return complete ? Expanded(
                    child: Center(
                      child: AlertDialog(
                        title: Text("Evento criado com sucesso!"),
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