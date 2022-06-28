import 'package:flutter/material.dart';
import 'widgets/City.dart';

class Home extends StatefulWidget {
  // ici les attributs non modifiables
  // on utilisera setState pour rendre à nouveau la classe _HomeState

  @override
  _HomeState createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  // ici les attributs que l'on peut modifier
  List cities = [
    {'name': 'Paris', 'image': 'assets/paris.jpg', 'checked': false},
    {'name': 'Marseille', 'image': 'assets/marseille.jpg', 'checked': false},
    {'name': 'Wissant', 'image': 'assets/wissant.jpg', 'checked': false},
  ];

  void changeChecked(city) {
    int index = cities.indexOf(city);
    setState(() {
      cities[index]['checked'] = !cities[index]['checked'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.home),
        title: Text('Holidays'),
        actions: <Widget>[
          Icon(Icons.more_vert),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ...cities.map(
              (city) {
                return City(
                  name: city['name'],
                  image: city['image'],
                  checked: city['checked'],
                  updateChecked: () {
                    changeChecked(city);
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}