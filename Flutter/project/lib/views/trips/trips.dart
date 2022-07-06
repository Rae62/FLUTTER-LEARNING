import 'package:flutter/material.dart';

class Trips extends StatefulWidget {
  static String routeName = '/trips';
  @override
  State<Trips> createState() => _TripsState();
}

class _TripsState extends State<Trips> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text('Hello'),
    );
  }
}
