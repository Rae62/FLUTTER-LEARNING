import 'package:flutter/material.dart';
import 'package:project/views/home/Home.dart';
import 'package:project/views/town/Town.dart';
import 'package:project/views/trips/trips.dart';

import 'models/city.model.dart';

main() {
  runApp(Holidays());
}

class Holidays extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) {
          return Home();
        }
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/town') {
          final City city = settings.arguments as City;
          return MaterialPageRoute(builder: (context) {
            return Town(
              city: city,
            );
          });
        } else if (settings.name == '/trips') {
          return MaterialPageRoute(builder: (context) {
            return Trips();
          });
        }
      },
    );
  }
}
