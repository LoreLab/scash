import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => new _RegisterScreenState();
}

class MyData {
  String name = '';
  String phone = '';
  String email = '';
  String password = '';
}

class _RegisterScreenState extends State<RegisterScreen > {

  @override
  Widget build(BuildContext context) {
    return new  Scaffold(
        appBar: new AppBar(
          title: new Text('Inscription'),
        ),
        body: new StepperBody(),
    );
  }
}

class StepperBody extends StatefulWidget {
  @override
  _StepperBodyState createState() => new _StepperBodyState();
}

class _StepperBodyState extends State<StepperBody> {
  int currStep = 0;
  static var _focusNode = new FocusNode();
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  static MyData data = new MyData();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {});
      print('Has focus: $_focusNode.hasFocus');
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  List<Step> steps = [
    new Step(
        title: const Text('Nom & Prenoms'),
        isActive: true,
        state: StepState.indexed,
        content: new TextFormField(
          focusNode: _focusNode,
          keyboardType: TextInputType.text,
          autocorrect: false,
          onSaved: (String value) {
            data.name = value;
          },
          maxLines: 1,
          validator: (value) {
            if (value.isEmpty || value.length < 1) {
              return 'Nom obligatoire';
            }
          },
          decoration: new InputDecoration(
              labelText: 'Entrer Votre Nom & prenoms',
              hintText: 'Entrer un Nom & prenoms',
              //filled: true,
              icon: const Icon(Icons.person),
              labelStyle:
              new TextStyle(decorationStyle: TextDecorationStyle.solid)),
        )),
    new Step(
        title: const Text('Numero de telephone'),
        isActive: true,
        state: StepState.indexed,
        content: new TextFormField(
          keyboardType: TextInputType.phone,
          autocorrect: false,
          validator: (value) {
            if (value.isEmpty || value.length < 10) {
              return 'Numero de telephone obligatoire';
            }
          },
          onSaved: (String value) {
            data.phone = value;
          },
          maxLines: 1,
          decoration: new InputDecoration(
              labelText: 'Entrer Votre numero de telephone',
              hintText: 'Entrer un numero de telephon',
              icon: const Icon(Icons.phone),
              labelStyle:
              new TextStyle(decorationStyle: TextDecorationStyle.solid)),
        )),
    new Step(
        title: const Text('Adresse Email'),
        isActive: true,
        state: StepState.indexed,
        content: new TextFormField(
          keyboardType: TextInputType.emailAddress,
          autocorrect: false,
          validator: (value) {
            if (value.isEmpty || !value.contains('@')) {
              return 'Adresse Email obligatoire';
            }
          },
          onSaved: (String value) {
            data.email = value;
          },
          maxLines: 1,
          decoration: new InputDecoration(
              labelText: 'Entrer votre Adresse Email',
              hintText: 'Entrer une Adresse Email',
              icon: const Icon(Icons.email),
              labelStyle:
              new TextStyle(decorationStyle: TextDecorationStyle.solid)),
        )),
    new Step(
        title: const Text('Mot de passe'),
        isActive: true,
        state: StepState.indexed,
        content: new TextFormField(
          keyboardType: TextInputType.text,
          autocorrect: false,
          obscureText: true,
          validator: (value) {
            if (value.isEmpty || value.length > 6) {
              return 'Mot de passe obligatoire';
            }
          },
          maxLines: 1,
          onSaved: (String value) {
            data.password = value;
          },
          decoration: new InputDecoration(
              labelText: 'Entrer votre mot de passe',
              hintText: 'Entrer un mot de passe',
              icon: const Icon(Icons.lock),
              labelStyle:
              new TextStyle(decorationStyle: TextDecorationStyle.solid)),
        )),
  ];

  @override
  Widget build(BuildContext context) {
    void showSnackBarMessage(String message,
        [MaterialColor color = Colors.red]) {
      Scaffold
          .of(context)
          .showSnackBar(new SnackBar(content: new Text(message)));
    }

    void _submitDetails() {
      final FormState formState = _formKey.currentState;

      if (!formState.validate()) {
        showSnackBarMessage('Please enter correct data');
      } else {
        formState.save();
        print("Nom & prenoms: ${data.name}");
        print("Numero de telephone : ${data.phone}");
        print("Email: ${data.email}");
        print("Mot de passe : ${data.password}");

        showDialog(
            context: context,
            child: new AlertDialog(
              title: new Text("Details"),
              content: new SingleChildScrollView(
                child: new ListBody(
                  children: <Widget>[
                    new Text("Nom & Prenoms : " + data.name),
                    new Text("Numero de telephone : " + data.phone),
                    new Text("Email : " + data.email),
                    new Text("Mot de passe : " + data.password),
                  ],
                ),
              ),
              actions: <Widget>[
                new FlatButton(
                  child: new Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ));
      }
    }

    return new Container(
        child: new Form(
          key: _formKey,
          child: new ListView(children: <Widget>[
            new Stepper(
              steps: steps,
              type: StepperType.vertical,
              currentStep: this.currStep,
              controlsBuilder: (BuildContext context, {VoidCallback onStepContinue, VoidCallback onStepCancel}) {
                return Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Row(
                    children: <Widget>[
                      FlatButton(
                        onPressed: onStepContinue,
                        child: Text("CONTINUER"),
                      ),
                      FlatButton(
                        onPressed: onStepCancel,
                        child: Text("ANNULER"),
                      )
                    ],
                  ),
                );
              },
              onStepContinue: () {
                setState(() {
                  if (currStep < steps.length - 1) {
                    currStep = currStep + 1;
                  } else {
                    currStep = 0;
                  }
                });
              },
              onStepCancel: () {
                setState(() {
                  if (currStep > 0) {
                    currStep = currStep - 1;
                  } else {
                    currStep = 0;
                  }
                });
              },
              onStepTapped: (step) {
                setState(() {
                  currStep = step;
                });
              },
            ),
            new Padding(
              padding: EdgeInsets.symmetric(vertical: 50.0),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0),),
                  child: new Text('ENREGISTRER',
                    style: new TextStyle(color: Colors.white),
                  ),
                  padding: EdgeInsets.all(12),
                  textColor: Colors.white,
                  splashColor: Colors.green,
                  color: Color(0xFF17B296),
                  onPressed: _submitDetails,
                ),
            ),
          ]),
        ));
  }
}