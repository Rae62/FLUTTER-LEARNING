import 'package:flutter/material.dart';
import 'package:project/models/travel.model.dart';
import 'package:project/rootWidgets/Drawer.dart';
import 'package:project/views/town/widgets/trip.list.dart';

class Trips extends StatefulWidget {
  static String routeName = '/trips';
  final List<Travel> trips;

  Trips({required this.trips});

  @override
  State<Trips> createState() => _TripsState();
}

class _TripsState extends State<Trips> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Mes voyages'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Prévisions'),
              Tab(text: 'Archivés'),
            ],
          ),
        ),
        drawer: ourDrawer(),
        body: TabBarView(
          children: [
            TripList(
              trips: widget.trips
                  .where((trip) => DateTime.now().isBefore(trip.date))
                  .toList(),
            ),
            TripList(
              trips: widget.trips
                  .where((trip) => DateTime.now().isAfter(trip.date))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}

