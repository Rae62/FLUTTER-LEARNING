import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      textDirection: TextDirection.ltr,
      children: <Widget>[
        Container(color: Colors.blue, height: 150.0, width: 200.0 ,
        child: Stack(alignment: Alignment.center,
        children: <Widget>[
          Text('Pimpers Paradise',
          textDirection : TextDirection.ltr),
          Container(color: Colors.grey.withOpacity(0.6), width: 300 , height: 100,)
        ],),),
        Expanded(child : Container(color: Colors.pink, height: 250.0, width: 200.0, child: Row(
          textDirection: TextDirection.ltr,children: <Widget>[
          Expanded(
            child :Container(height: 150.0, width: 200.0,color: Colors.green[200], child:Image(
        image: NetworkImage('https://cdn.pixabay.com/photo/2022/05/01/17/35/baltic-sea-7168094_960_720.jpg'),
        width: 180.00
      )),
          ),
         Expanded(
            child :Container(height: 150.0, width: 200.0,color: Colors.green[200], child:Image(
        image: NetworkImage('https://cdn.pixabay.com/photo/2022/05/01/17/35/baltic-sea-7168094_960_720.jpg'),
        width: 180.00
      )),
          ),
          ],
        ))),
        Container(color: Colors.teal, height: 200.0, width: 200.0),
      ]
    );
  }
}