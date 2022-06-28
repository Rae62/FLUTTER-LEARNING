import 'package:flutter/material.dart';

class City extends StatelessWidget {
  // attributs
  final String name;
  final String image;
  final bool checked;
  final VoidCallback updateChecked;

  // constructor
  City(
      {required this.name,
      required this.image,
      required this.checked,
      required this.updateChecked});

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
              image: AssetImage(image),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(checked ? Icons.star : Icons.star_border),
                          onPressed: () {
                            updateChecked();
                          },
                          color: Colors.white,
                          iconSize: 40,
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        name,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
