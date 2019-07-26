import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:scash/drawerHeader.dart';
import 'package:scash/epargnScreen.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Header(),
            Padding(
              padding: EdgeInsets.only(left: 16, top: 70),
              child: Text(
                'Transaction Recente',
                style: TextStyle(
                  color: Color(0xff1f1f1f),
                  fontFamily: 'Medium',
                  fontSize: 16,
                ),
              ),
            ),
            EpargnScreen(),
          ],
        ),
      ),
    );

  }
}

/*
child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            child: GestureDetector(
                              onTap: (){},
                              child: new Image.asset('assets/images/default.png'),
                            ),
                  ),
                          IconButton(
                            icon: Icon(
                              Icons.keyboard_arrow_down,
                              color: Colors.white,
                            ),
                            iconSize: 40.0,
                            onPressed: () {},
                          )
                        ],
                      ),
                      SizedBox(height: 30),
                      Text(
                        "Mon Cash",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "98 500",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 34.0,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
 */