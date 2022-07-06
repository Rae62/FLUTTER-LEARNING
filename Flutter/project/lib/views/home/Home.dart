import 'package:flutter/material.dart';
import 'package:project/models/city.model.dart';
import 'widgets/City.dart';

class Home extends StatefulWidget {
  static String routeName = "/";
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
    City(
      name: 'Paris',
      image: 'assets/paris.jpg',
    ),
    City(
      name: 'Marseille',
      image: 'assets/marseille.jpg',
    ),
    City(
      name: 'Wissant',
      image: 'assets/wissant.jpg',
    ),
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
        // leading: Icon(Icons.home),
        title: Text('Holidays'),
        actions: <Widget>[
          Icon(Icons.more_vert),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Container(
                height: 200,
                child: Text(
                  'Houlisdé',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Theme.of(context).primaryColor,
                    Theme.of(context).primaryColor.withOpacity(0.5),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.topRight,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Accueil'),
              onTap: () {
                Navigator.pushNamed(context, Home.routeName);
              },
            ),
            Divider(
              color: Colors.grey,
            ),
            ListTile(
              leading: Icon(Icons.flight),
              title: Text('Mes Voyages'),
              onTap: () {
                Navigator.pushNamed(context, Home.routeName);
              },
            ),
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ...cities.map(
              (city) {
                return CityCard(city: city);
              },
            )
          ],
        ),
      ),
    );
  }
}
