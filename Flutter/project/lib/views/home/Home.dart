import 'package:flutter/material.dart';
import 'package:project/views/home/widgets/City.dart';
import '../../models/city.model.dart';
import '../../rootWidgets/Drawer.dart';

class Home extends StatefulWidget {
  static String routeName = '/';
  final List<City> cities;

  Home({required this.cities});
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: Icon(Icons.home),
        title: Text('Holidays'),
        actions: <Widget>[
          Icon(Icons.more_vert),
        ],
      ),
      drawer: ourDrawer(),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ...widget.cities.map(
              (city) {
                return CityCard(city: city);
              },
            ),
          ],
        ),
      ),
    );
  }
}
