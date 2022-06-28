import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'home',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(title: Text('Uber bed'),
         actions : <Widget> [
          IconButton(onPressed: () => {print('click')}, icon: Icon(Icons.sync),
          )
        ],
        ),
        body: Center(
          child: Row( 
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget> [
              TextButton(onPressed: () {}, 
              child: Text('Button')),
              ElevatedButton(onPressed: () {}, 
              child: Text('Button',   style: TextStyle(color :Colors.purple),),
              style:ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 126, 190, 128),
              )
              ),
            ],
            
          )
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget> [
              DrawerHeader(
                child: Text('Vous revez de rentre chez vous dans un lit ?'),
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
              ),
              ListTile(
                title : Text('Reservation'),
              ),
              ListTile(
                title : Text('Login'),
              ),
            ],
          )
        ),
             floatingActionButton: FloatingActionButton(
        onPressed: () {
        },
        child: Text('Add'),
       ),
      ),
    );
  }
}
