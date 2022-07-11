import 'package:flutter/material.dart';
import 'package:project/models/city.model.dart';
import 'package:project/models/travel.model.dart';
import 'package:project/views/home/Home.dart';
import 'package:project/views/town/Town.dart';
import 'package:project/views/trips/widgets/trips.dart';
import './datas/data.dart' as data;

main() {
  runApp(Holidays());
}

class Holidays extends StatefulWidget {
  final List<City> cities = data.cities;

  @override
  HolidayState createState() => HolidayState();
}

class HolidayState extends State<Holidays> {
  List<Travel> mytrips = [
    Travel(
        city: 'Paris',
        activitiesToDo: [],
        date: DateTime.now().add(Duration(days: 1))),
    Travel(
        city: 'Marseille',
        activitiesToDo: [],
        date: DateTime.now().subtract(Duration(days: 1))),
    Travel(
        city: 'Calais',
        activitiesToDo: [],
        date: DateTime.now().add(Duration(days: 1))),
  ];

  void addTrip(Travel trips) {
    setState(() {
      mytrips.add(trips);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) {
            return Home(cities: widget.cities);
          },
        },
        onGenerateRoute: (setting) {
          if (setting.name == '/town') {
            final City city = setting.arguments as City;
            return MaterialPageRoute(builder: (context) {
              return Town(
                city: city,
                addTrip: addTrip,
              );
            });
          } else if (setting.name == '/trips') {
            return MaterialPageRoute(builder: (context) {
              return Trips(trips: mytrips);
            });
          }
        });
  }
}
