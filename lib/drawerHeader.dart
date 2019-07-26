import 'dart:async';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

class Header extends StatefulWidget {
  @override
  _HeaderState createState() {
    return new _HeaderState();
  }
}

class _HeaderState extends State<Header> {
  String _barcode = "";
  Future scan() async {
    try {
      String barcode = await BarcodeScanner.scan();
      setState(() => this._barcode = barcode);
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.CameraAccessDenied) {
        setState(() {
          this._barcode = 'El usuario no dio permiso para el uso de la cámara!';
        });
      } else {
        setState(() => this._barcode = 'Error desconocido $e');
      }
    } on FormatException {
      setState(() => this._barcode =
      'nulo, el usuario presionó el botón de volver antes de escanear algo)');
    } catch (e) {
      setState(() => this._barcode = 'Error desconocido : $e');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      overflow: Overflow.visible,
      children: <Widget>[
        Container(
          height: 300,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xff1e2a54),
                Color(0xff1773b3),
              ],
            ),
          ),
        ),

        Padding(
          padding: EdgeInsets.fromLTRB(16, MediaQuery.of(context).padding.top + 16, 16, 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage("assets/images/plus.png"),
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.all(30),
          alignment: Alignment.center,
          margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 46),
          child: Text("Mon Cash", textAlign: TextAlign.center, style: Theme.of(context).textTheme.button.copyWith(color: Colors.white, fontSize: 20,
            fontWeight: FontWeight.bold,
          )),
        ),
        Container(
          padding: EdgeInsets.all(60),
          alignment: Alignment.center,
          margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 60),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                child: Text("98  FCFA",  textAlign: TextAlign.center, style: Theme.of(context).textTheme.button.copyWith(color: Colors.white, fontSize: 20,)),
              ),
              Container(
                child: GestureDetector(
                  onTap: (){},
                  child: Image.asset("assets/images/plus.png", width: 40.0),
                )
              )
            ],
          ),
        ),
        /*
        Padding(
          padding: EdgeInsets.fromLTRB(25, MediaQuery.of(context).padding.top + 25, 25, 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[

              SizedBox(height: 10,),
              Container(
                alignment: Alignment.bottomCenter,
                child: Row(
                 /// mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(child: Text("98"),), SizedBox(height: 10),
                    Container( child: Image.asset("assets/images/plus.png"), width: 20,),
                  ],
                ),
              ),
            ],
          ),
        ), */
       /*
       Container(
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Image.asset("assets/images/plus.png",
                  width: 18,),
              ),
              Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 40),
                child: Text("Mon Cash", textAlign: TextAlign.center, style: Theme.of(context).textTheme.button.copyWith(color: Colors.white, fontSize: 20,
                  fontWeight: FontWeight.bold,
                )),
              ),
              SizedBox(height: 10),
              Expanded(
                child: Text("98"),
              ),
              Expanded(
                child: GestureDetector(
                  child: Image.asset("assets/images/plus.png", width: 50.0,),
                ),
              )
            ],
          ),
        ),
        */
        Positioned(
          bottom: -40,
          left: 16,
          child: Container(
            width: MediaQuery.of(context).size.width - 32,
            height: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new Container(
                  width: 150.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                    borderRadius: new BorderRadius.circular(5.0),
                    border: Border.all(color: Color(0xFF17B296), width: 1.0),
                    color: Color(0xFF17B296)
                  ),
                  child: new Material(
                    child: MaterialButton(
                      child: Text('EPARGNER',
                        style: Theme.of(context).textTheme.button.copyWith(color: Colors.white),
                      ),
                      onPressed: (){Navigator.pushNamed(context, '/register');},
                      highlightColor: Colors.green.withOpacity(0.5),
                      splashColor: Colors.green.withOpacity(0.5),
                    ),
                    color: Color(0xFF17B296),
                    borderRadius: new BorderRadius.circular(5.0),
                  ),
                ),
                new Container(
                  width: 150.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                    borderRadius: new BorderRadius.circular(5.0),
                    border: Border.all(color: Color(0xFF17B296), width: 1.0),
                    color: Color(0xFF17B296),
                  ),
                  child: new Material(
                    child: MaterialButton(
                      child: Text('PAYER',
                        style: Theme.of(context).textTheme.button.copyWith(color: Colors.white),
                      ),
                      onPressed: (){Navigator.of(context).pushNamed('/login');},
                      highlightColor: Colors.green[400],
                      splashColor: Colors.green[400],
                    ),
                    color: Color(0xFF17B296),
                    borderRadius: new BorderRadius.circular(5.0),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
