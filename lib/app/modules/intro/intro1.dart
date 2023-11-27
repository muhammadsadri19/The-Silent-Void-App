import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class Intro1 extends StatelessWidget {
  const Intro1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff353545),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 150),
            child: Image.asset(
              'assets/images/logo.png',
              height: 300,
              width: 300,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 30.0),
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width * 0.8,
            height: 50,
            decoration: BoxDecoration(
                border: Border.all(color: Color(0xffFFC700), width: 1),
                borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3))
                ]),
            child: Text(
              'WELCOME TO THE SILENT VOID ',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
