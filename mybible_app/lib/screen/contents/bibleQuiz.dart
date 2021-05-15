import 'package:flutter/material.dart';
import 'package:mybible_app/screen/contents/bibleQuizSecond.dart';

class Quiz extends StatefulWidget {
  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  @override
  int num;
  int num2;

  void initState() {
    // TODO: implement initState
    super.initState();
    num = 0;
    num2 = 1;
  }

  @override
  Widget build(BuildContext context) {
    List<String> type = ['성졸 대비', '넌센스'];

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
        body: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.7,
            child: InkWell(
              child: Card(
                elevation: 6,
                child: Column(
                  children: [
                    Flexible(
                      flex: 2,
                      child: Container(
                        height: 10000,
                        child: Container(),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            alignment: Alignment.center,
                            image: AssetImage(
                              "image/00$num2.png",
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Container(
                        height: 1000,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              child: Icon(Icons.arrow_left),
                              onTap: () {
                                setState(() {
                                  if (num == type.length - 1) {
                                    num = 0;
                                  } else {
                                    num++;
                                  }
                                  print(num);
                                  if(  num2 == 1 ){
                                    num2 =5;
                                  }
                                  else
                                    num2--;
                                });
                              },
                            ),
                            Text(
                              type[num],
                              style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.024,
                                  fontWeight: FontWeight.w100),
                            ),
                            InkWell(
                              child: Icon(Icons.arrow_right),
                              onTap: () {
                                setState(() {
                                  if (num == type.length - 1) {
                                    num = 0;
                                  } else {
                                    num++;
                                  }
                                  print(num);
                                  if(  num2 == 5 ){
                                    num2 =1;
                                  }
                                  else
                                    num2++;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              onTap: (){
              },
            ),
          ),
        ),
      ),
    );
  }
}
