import 'package:flutter/material.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  Center(
      
      child: Text.rich(
        TextSpan(
          text: 'Fr',
          style:TextStyle(
            color: Colors.blue
          ),
          children:[
TextSpan(
          text: 'an',
          style:TextStyle(
            color: Colors.white
          ),
),
              TextSpan(
          text: 'ce',
          style:TextStyle(
            color: Colors.red
          ),
              ),
          ],
        ),textDirection: TextDirection.ltr,
        style: TextStyle(
          fontSize: 50
        ),
        )

       );
  }
}