import 'package:flutter/material.dart';
import 'package:mybible_app/screen/contents/bibleQuizSecond.dart';

class Quiz extends StatefulWidget {
  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  @override
  Widget build(BuildContext context) {
    List<String> type = ['쉬움', '중간', '어려움', '최강어려움', '넌센스'];
    return MaterialApp(
      theme: ThemeData(
          appBarTheme: AppBarTheme(
              backgroundColor: Colors.white,
              iconTheme: IconThemeData(color: Colors.black))),
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back)),
          title: Text(
            "퀴즈",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: ListView.builder(
            itemCount: type.length,
            itemBuilder: (BuildContext context, index) {
              return Container(
                child: Column(
                  children: [
                    InkWell(
                      child: Container(
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            alignment: Alignment.center,
                            image: AssetImage(
                              "image/00${index + 1}.png",
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => QuizSecond(),
                          settings: RouteSettings(
                            arguments: index,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      type[index],
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
