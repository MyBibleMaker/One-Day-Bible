import 'package:flutter/material.dart';

class QuizSecond extends StatefulWidget {
  @override
  _QuizSecondState createState() => _QuizSecondState();
}

class _QuizSecondState extends State<QuizSecond> {
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
          "성졸 대비",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
      ),
    );
  }
}
