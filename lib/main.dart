import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scash/home.dart';
import 'package:scash/loginScreen.dart';
import 'package:scash/onboarding/Load.dart';
import 'package:scash/registerScreen.dart';
import 'package:scash/scanScreen.dart';
import 'package:scash/splashScreen.dart';
import 'package:scash/welcomeScreen.dart';

void main() { SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
  statusBarColor: Colors.transparent,
));
  return  runApp(MyApp());}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      routes: <String, WidgetBuilder> {
        '/load' : (BuildContext context) => Load(),
        '/login' : (BuildContext context) => LoginScreen(),
        '/splash' : (BuildContext context) => SlideSplashScreen(),
        '/register' : (BuildContext context) => RegisterScreen(),
        '/home' : (BuildContext context) => Home(),
        '/scan' : (BuildContext context) => ScanScreen(),
      },
      home: WelcomeScreen(),
    );
  }
}
