import 'package:intro_slider/intro_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:scash/loginScreen.dart';


class SlideSplashScreen extends StatefulWidget{
  @override
  _SlideSplashScreenState createState() => _SlideSplashScreenState();
}

class _SlideSplashScreenState extends State<SlideSplashScreen>  {

  List<Slide> slides = new List();

  @override
  void initState() {
    super.initState();

    slides.add(
      new Slide(
        pathImage: 'assets/images/retrait.png',
        title: "Recharger sa Carte S-Cash ",
        styleTitle: TextStyle(color: Colors.black,
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoMono'),
           description: "Recharger sa carte 24H/24H sans se rendre en banque instantanement. ",
        styleDescription: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
            fontFamily: 'Raleway'),
        marginDescription: EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0, bottom: 70.0),
        directionColorBegin: Alignment.topLeft,
        directionColorEnd: Alignment.bottomRight,
        onCenterItemPress: () {},
      ),
    );

    slides.add(
      new Slide(
        pathImage: 'assets/images/exchange.png',
        title: "Retirer de l'argent ",
        styleTitle: TextStyle(color: Colors.black,
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoMono'),
        description: "Retirer de l'argent dans les Gab avec son mobile en cas d'oublie de votre carte. ",
        styleDescription: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
            fontFamily: 'Raleway'),
        marginDescription: EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0, bottom: 70.0),
        directionColorBegin: Alignment.topLeft,
        directionColorEnd: Alignment.bottomRight,
        onCenterItemPress: () {},
      ),
    );

    slides.add(
      new Slide(
        pathImage: 'assets/images/mobile.png',
        title: "Paiement",
        styleTitle: TextStyle(color: Color(0xffD02090),
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoMono'),
        description: "Payer en ligne et dans les points marchands avec votre mobile. ",
        styleDescription: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
            fontFamily: 'Raleway'),
        marginDescription: EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0, bottom: 70.0),
        directionColorBegin: Alignment.topLeft,
        directionColorEnd: Alignment.bottomRight,
        onCenterItemPress: () {},
      ),
    );

    slides.add(
      new Slide(
        pathImage: "assets/images/profit.png",
        title: "Epargne",
        styleTitle: TextStyle(
            color: Colors.black,
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoMono'),
        description: "Plus de montant minimum, epargner a partir de 100 FCFA",
        styleDescription: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
            fontFamily: 'Raleway'),
        colorBegin: Color(0xffFFFACD),
        colorEnd: Color(0xffFF6347),
        directionColorBegin: Alignment.topRight,
        directionColorEnd: Alignment.bottomLeft,
      ),
    );
    slides.add(
      new Slide(
        pathImage: "assets/images/bank.png",
        title: "Credit",
        styleTitle: TextStyle(
            color: Colors.black,
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoMono'),
        description: "Emprunter sans garantie de maniere instantane 24H/24H. ",
        styleDescription: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
            fontStyle: FontStyle.italic,
            fontFamily: 'Raleway'),
        colorBegin: Color(0xffFFA500),
        colorEnd: Color(0xff7FFFD4),
        directionColorBegin: Alignment.topCenter,
        directionColorEnd: Alignment.bottomCenter,
      ),
    );
  }

  void onDonePress() {
    // Do what you want
    Navigator.push(context,
      new MaterialPageRoute(
        builder: (BuildContext context) {
          return new LoginScreen();
        },
      ),
    );
  }

  Widget renderNextBtn() {
    return Icon(
      Icons.navigate_next,
      color: Color(0xFF17B296),
      size: 35.0,
    );
  }

  Widget renderDoneBtn() {
    return Icon(
      Icons.done,
      color: Color(0xFF17B296),
    );
  }

  Widget renderSkipBtn() {
    return Icon(
      Icons.skip_next,
      color: Color(0xFF17B296),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
    new IntroSlider(
    // List slides
    slides: this.slides,

      // Skip button
      renderSkipBtn: this.renderSkipBtn(),
      colorSkipBtn: Color(0x33000000),
      highlightColorSkipBtn: Color(0xff000000),

      // Next button
      renderNextBtn: this.renderNextBtn(),

      // Done button
      renderDoneBtn: this.renderDoneBtn(),
      onDonePress: this.onDonePress,
      colorDoneBtn: Color(0xFF17B296),
      highlightColorDoneBtn: Color(0xff000000),

      // Dot indicator
      colorDot: Colors.lightGreen,
      colorActiveDot: Color(0xFF17B296),
      sizeDot: 13.0,

      // Show or hide status bar
      shouldHideStatusBar: true,
    ),
      ],
    );
  }
}