import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image(
        // image: NetworkImage('https://www.protegez-vous.ca/var/protegez_vous/storage/images/_aliases/article_banner/mediatheque/illustrations-et-images/archives/2012-06/resto_img_1536x1146/147494-1-fre-CA/Resto_img_1536x1146.jpg'),
        image: AssetImage('assets/logo jurassic.png'),
        width: 500,
      ),
    );
  }
}