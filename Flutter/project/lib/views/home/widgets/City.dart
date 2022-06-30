import 'package:flutter/material.dart';
import 'package:project/models/city.model.dart';
import 'package:project/views/town/Town.dart';

class CityCard extends StatelessWidget {
  final City city;

  // constructor
  CityCard({required this.city});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      child: Container(
        height: 200,
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Ink.image(
              fit: BoxFit.cover,
              image: AssetImage(city.image),
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/town',
                    arguments: city,
                  );
                },
              ),
            ),
            Positioned(
              top: 10,
              left: 10,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 5,
                ),
                child: Text(
                  city.name,
                  style: TextStyle(
                      fontSize: 35,
                      color: Colors.white,
                      backgroundColor: Colors.black54),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
