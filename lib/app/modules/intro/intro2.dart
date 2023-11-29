import 'package:flutter/material.dart';

class Intro2 extends StatefulWidget {
  const Intro2({Key? key}) : super(key: key);

  @override
  _Intro2State createState() => _Intro2State();
}

class _Intro2State extends State<Intro2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/bgIntro/bg-intro2.jpg'),
              fit: BoxFit.cover)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 200),
            child: Image.asset(
              'assets/images/logo.png',
              height: 100,
              width: 100,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, right: 30, left: 30),
            child: Text(
              "Welcome to The Silent Void",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'Exo2',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, right: 30, left: 30),
            child: Text(
              "a place where silence meets excitement, and new gamers are welcomed with open arms! We are excited to welcome you to this community, where passion for gaming comes together in a space filled with intimacy and engagement. Together, let's explore and celebrate the beautiful world of gaming within The Silent Void.",
              textAlign: TextAlign.justify,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'Exo2',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
