import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

SharedPreferences? localStorage;

class _LoginPageState extends State<LoginPage> {
  void initState() {
    super.initState();
    cek();
  }

  cek() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    String? value = pref.getString("login");
    if (value != null) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => Home()), (route) => false);
    }
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController pwdController = TextEditingController();

  void login() async {
    var response = await http.post(
        Uri.parse("http://192.168.167.207:8000/login"),
        body: ({
          "email": emailController.text,
          "password": pwdController.text
        }));
    if (response.statusCode == 200) {
      final body = json.decode(response.body);

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Login berhasil"),
      ));

      authpage(body["token"]);
    } else {
      print("gagal");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Center(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 200),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Email Id:",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                        controller: emailController,
                        obscureText: false,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            fillColor: Color(0xfff3f3f4),
                            filled: true))
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Password :",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                        controller: pwdController,
                        obscureText: true,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            fillColor: Color(0xfff3f3f4),
                            filled: true))
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 50),
              ),
              RaisedButton(
                onPressed: login,
                child: Text('Login'),
              ),
              Padding(
                padding: EdgeInsets.only(top: 50),
              ),
              if (localStorage != null)
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    "User Logged in!!! ->  Email Id: ${localStorage!.get('email')}  Password: ${localStorage!.get('password')}",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  void authpage(String token) async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    await pref.setString("login", token);
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => Home()), (route) => false);
  }
}
