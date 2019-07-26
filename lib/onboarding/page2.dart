import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Page2 extends StatefulWidget {
  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: double.infinity,
      width: double.infinity,
      child: Stack(
        children: <Widget>[
          new Positioned.fill(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                 padding: const EdgeInsets.only(top: 10.0),
                  child: Image(
                    image: AssetImage('assets/images/exchange.png'),
                    fit: BoxFit.fitHeight,
                    width: 100,
                    height: 100.0,
                  ),
              ),
                new Padding(
                  padding: const EdgeInsets.only(top: 30.0, bottom: 10.0, left: 30.0, right: 30.0),
                  child: Text('Retirer de l\'argent',
                    style: Theme.of(context).textTheme.display1.copyWith(color: Colors.black,fontSize: 40.0, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                 padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
                  child: Text('Retirer de l\'argent dans les Gab avec son mobile en cas d\'oublie de votre carte.',
                    style: Theme.of(context).textTheme.body1.copyWith(color: Colors.black,fontSize: 16.0),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          )
        ],
        alignment: FractionalOffset.center,
      ),
    );
  }
}