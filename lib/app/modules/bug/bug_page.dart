import 'package:flutter/material.dart';
class BugPage extends StatefulWidget {
  const BugPage({ Key? key }) : super(key: key);

  @override
  _BugPageState createState() => _BugPageState();
}

class _BugPageState extends State<BugPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('BUG PAGE',  style: TextStyle(color: Colors.white),),
    );
  }
}