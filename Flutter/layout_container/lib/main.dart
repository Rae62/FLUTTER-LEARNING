import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color:Colors.green,
      alignment: Alignment.center,
      margin: EdgeInsets.all(30),
      child: Container(
        width: 300,
        height: 300,
        padding : EdgeInsets.only(bottom: 40),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.red,
          border: Border.all(color: Colors.blue , width: 3 , style: BorderStyle.solid),
          boxShadow: [BoxShadow(color: Colors.black , spreadRadius: 15 , blurRadius: 10)],
          borderRadius: BorderRadius.circular(100)
        ),
        child:
        Text(
          'Hard les containers ? ',
          textDirection: TextDirection.ltr,
        ),
        // Image(
        //   image: NetworkImage('https://www.protegez-vous.ca/var/protegez_vous/storage/images/_aliases/article_banner/mediatheque/illustrations-et-images/archives/2012-06/resto_img_1536x1146/147494-1-fre-CA/Resto_img_1536x1146.jpg'),
        // width: 300,
        // ),
      )

    );
  }
}