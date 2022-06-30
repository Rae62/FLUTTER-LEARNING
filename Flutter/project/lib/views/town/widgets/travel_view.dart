import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../models/travel.model.dart';

class TravelView extends StatelessWidget {
  final VoidCallback setDate;
  final Travel ourTravel;
  final String cityName;
  final double amount;

  TravelView(
      {required this.ourTravel,
      required this.setDate,
      required this.cityName,
      required this.amount});
  double get montant {
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation;
    var size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(10),
      height: 150,
      width: orientation == Orientation.landscape
          ? size.width * 0.5
          : double.infinity,
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Text(
            cityName,
            style: TextStyle(
              fontSize: 20,
              decoration: TextDecoration.underline,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Text(DateFormat('d/M/y').format(ourTravel.date)),
              ),
              ElevatedButton(
                onPressed: setDate,
                child: Text(
                  'Date',
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  'Montant par personne',
                  style: TextStyle(fontSize: 15),
                ),
              ),
              Text(
                ' $amount euros',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
