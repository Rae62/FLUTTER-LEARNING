import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project/models/travel.model.dart';


class TripList extends StatelessWidget {
final List<Travel> trips;

TripList ({required this.trips});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: trips.length,
      itemBuilder: (context, i) {
        var trip = trips[i];
        return ListTile(
          title: Text(trip.city),
          subtitle: trip.date != null
          ? Text(DateFormat('d/M/y').format(trip.date))
          : null,
          trailing: const Icon(Icons.info),
        );
      } );
  }
}