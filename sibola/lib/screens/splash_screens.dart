import 'dart:async';

import 'package:flutter/material.dart';

import 'homepage.dart';

class SplashScreens extends StatefulWidget {
  const SplashScreens({ Key? key }) : super(key: key);

  @override
  State<SplashScreens> createState() => _SplashScreensState();
}

class _SplashScreensState extends State<SplashScreens> {
  
  @override
  void initState() {
    
    super.initState();
    Timer(
      Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => HomePage())));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
      width: double.infinity,
      height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            colors: [Color(000000), Color(0xFFF1E6FF),
            ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Image.asset('assets/images/logo.png',
                    height: 300.0,
                    width: 300.0,
                  ),
                  Text(
                    "Sistem Informasi Booking Lapangan Indramayu",
                    textAlign: TextAlign.center,
                    style:TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                ],
              ),
              
              CircularProgressIndicator(),
            ],
          )
      ),
    );
  }
}