import 'package:flutter/material.dart';
import 'package:project/views/home/Home.dart';
import 'package:project/views/town/Town.dart';

main() {
  runApp(Holidays());
}

class Holidays extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.purple,
          appBarTheme: AppBarTheme(
              titleTextStyle: TextStyle(fontSize: 30, color: Colors.white),
              centerTitle: true,
              color: Color.fromARGB(255, 62, 1, 72))),
      debugShowCheckedModeBanner: false,
      // home: Home(),
      home: Home(),
      routes: {
        '/': ((context) {
          return Home();
        }),
        '/town': ((context) {
          return Town();
        }),
      },
    );
  }
}
