import 'package:flutter/material.dart';

class Intro1 extends StatefulWidget {
  const Intro1({Key? key}) : super(key: key);

  @override
  _Intro1State createState() => _Intro1State();
}

class _Intro1State extends State<Intro1> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/bgIntro/bg-intro1.jpg'),
              fit: BoxFit.cover)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/logo.png',
            height: 150,
            width: 150,
          ),
          SizedBox(
            height: 20,
          ),
          
        ],
      ),
    );
  }
}
