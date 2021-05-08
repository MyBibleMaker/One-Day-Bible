import 'package:flutter/material.dart';

class Word extends StatefulWidget {
  @override
  _WordState createState() => _WordState();
}

class _WordState extends State<Word> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          appBarTheme: AppBarTheme(
              backgroundColor: Colors.white,
              iconTheme: IconThemeData(
                  color: Colors.black
              )
          )
      ),
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          leading:
          IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon: Icon(Icons.arrow_back))
          ,
          title: Text("말씀",style: TextStyle(color: Colors.black),),
        ),
      ),
    );
  }
}
