import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({ Key? key }) : super(key: key);

  @override
  State<Dashboard> createState() => _DasboardState();
}

class _DasboardState extends State<Dashboard> {
  int _currentIndex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Text('Dashboard'), 
      ),
      body: Container(),
      bottomNavigationBar: BottomNavigationBar(
      currentIndex: _currentIndex,
      type: BottomNavigationBarType.fixed,
      items: [
      BottomNavigationBarItem(icon: Icon(Icons.home), label:'home' ,backgroundColor:Colors.blue),
      BottomNavigationBarItem(icon: Icon(Icons.bookmark), label:'transaction' ,backgroundColor:Colors.blue),
      BottomNavigationBarItem(icon: Icon(Icons.flag), label:'event' ,backgroundColor:Colors.blue),
      BottomNavigationBarItem(icon: Icon(Icons.person), label:'user' ,backgroundColor:Colors.blue),
      ],
      onTap:(index){
      setState((){
      _currentIndex = index;
      });
      }),
    );
  }
}