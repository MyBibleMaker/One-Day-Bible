import 'package:flutter/material.dart';
import 'package:mybible_app/screen/contents/bibleQuiz.dart';
import 'package:mybible_app/screen/contents/bibleStory.dart';
import 'package:mybible_app/screen/contents/bibleWord.dart';

class All_screen extends StatefulWidget {
  @override
  _All_screenState createState() => _All_screenState();
}

class _All_screenState extends State<All_screen> {
  @override
  Widget build(BuildContext context) {
    var list =["성경 말씀","성경 퀴즈","성경 이야기"];
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(height: 40,),
          Container(
            alignment: Alignment(-0.9,-1),
            child:IconButton(
              onPressed: (){
                Navigator.pop(context);
              },
              alignment: Alignment.bottomLeft,
              icon: Icon(Icons.arrow_back),),),
          Flexible(
              flex: 9,
              child: GridView.count(
                crossAxisCount: 2,
                children: List.generate(3, (index) {
                  return Column(
                    children: [
                      Flexible(
                          flex:8,
                          child: IconButton(
                            icon: Image.asset("image/bible$index.jpg"),
                            iconSize: 300,
                            onPressed: (){
                              Navigator.push(context,MaterialPageRoute(builder: (context)=>
                              index == 0? Word():index == 1 ? Quiz() :Story()
                              ));
                            },
                          )),
                      Flexible(child: Text( list[index])),
                    ],
                  );
                }),
              ),
          ),
        ],
      )

    );
  }
}
