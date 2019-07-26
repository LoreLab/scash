import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Color(0xFF17B296),
            Color(0xFF214B81),
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
//            stops: [0.2, 0.7],
              //begin: Alignment(0.5, -1.0),
              //end: Alignment(0.5, 1.0)
          ),
        ),
        child: Stack(
          children: <Widget>[
            ListView(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 70.0, bottom: 10.0, left: 10.0, right: 10.0),
                  child: Text("Bienvenue chez S-Cash",
                    softWrap: true,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 30.0),
                  child: Text('Le premier Service bancaire mobile inclusif, intelligent, taille sur mesure pour votre liberte financiere',
                    style: TextStyle(fontSize: 18.0, color: Colors.white),textAlign: TextAlign.left,),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 100.0),
                  child: Container(
                    width: 150.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      border: Border.all(color: Colors.white, width: 1.0),
                      color: Colors.white,
                    ),
                    child: Material(
                      child: MaterialButton(
                        child: Text("SUIVANT", style: TextStyle(color: Color(0xFF17B296), fontSize: 16.0),),
                        onPressed: (){Navigator.of(context).pushNamed('/load');},
                        highlightColor: Colors.green.withOpacity(0.5),
                        splashColor: Colors.green.withOpacity(0.5),
                      ),
                      color: Colors.transparent,
                      borderRadius: new BorderRadius.circular(5.0),
                    ),
                  )
                )
              ],
            )
          ],
        ),
      )
    );
  }
}