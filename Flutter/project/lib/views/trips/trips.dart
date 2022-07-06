import 'package:flutter/material.dart';
import 'package:project/root_widgets/Drawer.dart';

class Trips extends StatefulWidget {
  static String routeName = '/trips';
  @override
  State<Trips> createState() => _TripsState();
}

class _TripsState extends State<Trips> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mes Voyages'),
      ),
      drawer: OurDrawer(),
      body: Container(
        alignment: Alignment.center,
        child: Text('trips'),
      ),
    );
  }
}
