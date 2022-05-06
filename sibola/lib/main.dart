import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sibola/constrain.dart';
import 'package:sibola/screens/dashboard.dart';
import 'package:sibola/screens/splash_screens.dart';

void main() {
  //SystemChrome.setSystemuUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
      title: 'SIBOLA',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: SplashScreens(),
    );
  }
}
