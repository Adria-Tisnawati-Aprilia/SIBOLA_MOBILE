import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sibola/auth/login.dart';

import 'homepage.dart';

class SplashScreens extends StatefulWidget {
  const SplashScreens({ Key? key }) : super(key: key);

  @override
  State<SplashScreens> createState() => _SplashScreensState();
}

class _SplashScreensState extends State<SplashScreens> {
  void initState() {
    super.initState();
    cek();
  }

  cek() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var loading = const Duration(seconds: 3);
    String? value = pref.getString("login");
    return Timer(loading, () {
      if (value != null){
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => HomePage()), (route) => false);
      }else{
      Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
      }
    });
    if (value != null) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => HomePage()), (route) => false);
    }
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