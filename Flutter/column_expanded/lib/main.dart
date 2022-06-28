import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      textDirection: TextDirection.ltr,
      children: <Widget>[
        Container(
          color: Colors.blue,
          height: 150,
          width: 200,
        ),
        Expanded(child:  Container(
          color: Colors.white,
          height: 250,
          width: 200,
        ),),
       
        Container(
          color: Colors.red,
          height: 200,
          width: 200,
        ),
      ],
    );
  }
}
