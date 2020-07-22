import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(
      MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.blue,
          appBar: AppBar(
            title: Text('Magic 8 Ball'),
            backgroundColor: Colors.blue.shade800,
          ),
          body: ballPage(),
        ),
      ),
    );

class ballPage extends StatefulWidget {
  @override
  _ballPageState createState() => _ballPageState();
}

class _ballPageState extends State<ballPage> {
  int answer = 1;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FlatButton(
        onPressed: (){
          setState(() {
            answer = Random().nextInt(5) + 1 ;
          });
        },
        child: Image.asset('images/ball$answer.png'),
      ),
    );
  }
}
