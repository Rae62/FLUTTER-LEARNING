import 'package:flutter/material.dart';
import 'package:project/views/home/Home.dart';
import 'package:project/views/trips/widgets/trips.dart';
import 'package:project/views/trips/widgets/trips.dart';

class ourDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Container(
              height: 200,
              // color: Theme.of(context).primaryColor,
              child: const Text(
                'Holidays',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
                textAlign: TextAlign.center,
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
            color: Colors.grey[600],
            indent: 20,
            endIndent: 20,
          ),
          ListTile(
            leading: Icon(Icons.flight),
            title: Text('Mes voyages'),
            onTap: () {
             Navigator.pushNamed(context, Trips.routeName);
            },
          )
        ],
      ),
    );
  }
}
