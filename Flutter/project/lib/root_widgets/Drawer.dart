import 'package:flutter/material.dart';
import 'package:project/views/home/Home.dart';
import 'package:project/views/trips/trips.dart';

class OurDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Drawer(
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
              indent: 20,
              endIndent: 20,
            ),
            ListTile(
              leading: Icon(Icons.flight),
              title: Text('Mes Voyages'),
              onTap: () {
                Navigator.pushNamed(context, Trips.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}
