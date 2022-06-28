import 'package:flutter/material.dart';
import 'delayed_animation.dart';
import 'package:google_fonts/google_fonts.dart';

  const d_background = const Color(0xFFEDECF2);
  const d_red = const Color(0xFFE9717D);


class WelcomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: d_background,
      // appBar: AppBar(
      //   title: Text('Yoga App', style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
      // ),centerTitle: true
      // ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(
            vertical: 60,
            horizontal: 30,
          ),
          child: Column(
            children: [
              DelayedAnimation(
                delay: 1500,
                child: Container(
                  alignment: Alignment.center,
                  height: 170,
                  child: Image.asset('images/yoga_1.png')
                ),
              ),
              DelayedAnimation(
                delay: 2500,
                child: Container(
                  alignment: Alignment.center,
                  height: 400,
                  child: Image.asset('images/yoga_2.jpeg')
                ),
              ),
              DelayedAnimation(
                delay: 3500,
                child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(
                    top: 30,bottom: 20
                  ),
                  child: Text(
                    'Get fitter, stronger and embrace a healthier lifestyle',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      color: Colors.grey,fontSize: 16
                    ),
                  ),
                ),
              ),
              DelayedAnimation(
                delay: 4500,
                child: Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                    primary: d_red,
                    shape: StadiumBorder(),
                    padding: EdgeInsets.all(13)),
                    child: Text('GET STARTED'),
                    onPressed: () {},
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}