import 'package:flutter/material.dart';

class QuizThird extends StatefulWidget {
  @override
  _QuizThirdState createState() => _QuizThirdState();
}

class _QuizThirdState extends State<QuizThird> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.popAndPushNamed(context, '/quiz');
          },
          icon: Icon(Icons.arrow_back),color: Colors.black,),
        title: Text(
          "넌센스",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
      ),
    );
  }
}
