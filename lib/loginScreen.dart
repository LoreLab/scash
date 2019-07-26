import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:scash/validator.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  FocusNode _focusNodeEmail = new FocusNode();
  FocusNode _focusNodePassword = new FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final logo = Image(
      image: AssetImage("assets/images/launcher_icon.png"),
      width: 40,
      height: 70.0,
    );

    final email = TextFormField(
      focusNode: _focusNodeEmail,
      keyboardType: TextInputType.number,
      autofocus: false,
      controller: _email,
      validator: Validator.validateNumber,
      decoration: InputDecoration(
        labelText: 'Numero de telephone',
        hintText: 'Entrez votre Numero de telephone',
        contentPadding: EdgeInsets.fromLTRB(25.0, 15.0, 25.0, 15.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
      ),
    );

    final password = TextFormField(
      focusNode: _focusNodePassword,
      autofocus: false,
      obscureText: true,
      controller: _password,
      validator: Validator.validatePassword,
      decoration: InputDecoration(
        labelText: 'Mot de passe',
        hintText: 'Entrez votre mot de passe',
        contentPadding: EdgeInsets.fromLTRB(25.0, 15.0, 25.0, 15.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
      ),
    );

    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 50.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0),
        ),
        onPressed: () {Navigator.pushNamed(context, '/home');},
        padding: EdgeInsets.all(12),
        textColor: Colors.white,
        splashColor: Colors.green,
        color: Color(0xFF17B296),
        child: Text('CONNECTER', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w700),),
      ),
    );

    final forgotLabel = FlatButton(
      child: Text(
        'Mot de passe oublie ?',
        style: TextStyle(color: Colors.black54),
      ),
      onPressed: () {
        Navigator.pushNamed(context, '/forgot-password');
      },
    );

    final account = Text(
      "Vous n'avez pas de compte ?",
      softWrap: true,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.grey,
        decoration: TextDecoration.none,
        fontSize: 16.0,
        fontWeight: FontWeight.w300,
      )
    );

    final registerLabel = FlatButton(
      child: Text('S\'inscrire !',
        style: TextStyle(color: Color(0xFF17B296),fontSize: 20.0,),
      ),
      onPressed: () {
        Navigator.pushNamed(context, '/register');
      },
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
           child: Center(
             child: SingleChildScrollView(
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 crossAxisAlignment: CrossAxisAlignment.stretch,
                 children: <Widget>[
                   logo,
                   SizedBox(height: 48.0),
                   email,
                   SizedBox(height: 24.0),
                   password,
                   SizedBox(height: 12.0),
                   loginButton,
                   forgotLabel,
                   Divider(),
                   account,
                   registerLabel,
                 ],
               ),
             ),
           ),
        ),
      ),
    );
  }
}
