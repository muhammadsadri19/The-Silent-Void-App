import 'package:flutter/material.dart';
class IdcardPage extends StatefulWidget {
  const IdcardPage({ Key? key }) : super(key: key);

  @override
  _IdcardPageState createState() => _IdcardPageState();
}

class _IdcardPageState extends State<IdcardPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('ID CARD PAGE',  style: TextStyle(color: Colors.white),),
    );
  }
}