import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const dGreen = Color(0xFF2ac0a6);
const dWhite = Colors.white;
const dBlack = Colors.black;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WhatsApp.Redesign',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: dBlack,
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.menu,
              color: dWhite,
              size: 30,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search_rounded,
                color: dWhite,
                size: 30,
              ),
            ),
          ]),
      body: Column(
        children: [
          MenuSection(),
          FavoriteSection(),
          Expanded(
            child: Container(
              color: Colors.green,
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: dGreen,
        onPressed: () {},
        child: const Icon(
          Icons.edit,
          size: 20,
        ),
      ),
    );
  }
}

class MenuSection extends StatelessWidget {
  const MenuSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List menuItems = ['Message', 'Online', 'Groups', 'Calls'];

    return Container(
      color: dBlack,
      height: 100,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            children: menuItems.map((item) {
              return Container(
                margin: EdgeInsets.only(right: 55),
                child: Text(
                  item,
                  style: GoogleFonts.inter(color: Colors.white60, fontSize: 29),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class FavoriteSection extends StatelessWidget {
  const FavoriteSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List FavoriteContacts = [
      {
        'name': 'Alla',
        'profile': 'images/avatar/a1.jpg',
      },
      {
        'name': 'Julia',
        'profile': 'images/avatar/a2.jpg',
      },
      {
        'name': 'Mike',
        'profile': 'images/avatar/a3.jpg',
      },
      {
        'name': 'Mickey',
        'profile': 'images/avatar/a4.jpg',
      },
      {
        'name': 'Jennie',
        'profile': 'images/avatar/a5.jpg',
      },
      {
        'name': 'Jannica',
        'profile': 'images/avatar/a6.jpg',
      },
      {
        'name': 'John',
        'profile': 'images/avatar/a7.jpg',
      },
    ];

    return Container(
      color: dBlack,
      padding: EdgeInsets.all(10),
      child: Container(
        height: 100,
        padding: EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          color: dGreen,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(40),
            topLeft: Radius.circular(40),
          ),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 15),
                  child: Text(
                    'Favorite contacts',
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.more_horiz,
                    color: Colors.white,
                    size: 20,
                  ),
                  onPressed: null,
                ),
              ],
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: FavoriteContacts.map((favorite) {
                  return Container(
                    margin: EdgeInsets.only(left: 15),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(5),
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: CircleAvatar(
                            radius: 28,
                            backgroundImage: AssetImage(favorite['profile']),
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(favorite['name'])
                      ],
                    ),
                  ) ;
                }).toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
