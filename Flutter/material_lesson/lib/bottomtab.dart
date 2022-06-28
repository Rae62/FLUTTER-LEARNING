import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'home',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
       body: Container(
        child: Text('WORDLE'),
        alignment: Alignment.center,
       ),
       bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.access_alarm_sharp),label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.add_business_sharp),label: 'buisness'),
          BottomNavigationBarItem(icon: Icon(Icons.schedule_sharp),label: 'Time'),
        ],
        backgroundColor: Colors.deepPurpleAccent,
        selectedItemColor: Colors.white,
        showSelectedLabels: false,
        showUnselectedLabels: false,
       ),
       
      ),
    );
  }
}
