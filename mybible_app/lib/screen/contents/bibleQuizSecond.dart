import 'package:flutter/material.dart';

class QuizSecond extends StatefulWidget {
  @override
  _QuizSecondState createState() => _QuizSecondState();
}

class _QuizSecondState extends State<QuizSecond> {
  String quiz, answer, check1, check2, check3, check4;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    quiz = "예수님이 표적을 행해도 유대인이 믿지 않는 것은 선지자 누구의 말씀을 이루려 한것일까?";
    answer = "이사야";
    check1 = "이사야";
    check2 = "바울";
    check3 = "막달라 마리아";
    check4 = "누가";
  }

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
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
        ),
        title: Text(
          "인물 퀴즈",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Center(
        child: Card(
          elevation: 5,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.7,
            width: MediaQuery.of(context).size.width * 0.8,
            child: Column(
              children: [
                Flexible(
                  flex: 3,
                  child: Container(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          quiz,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  flex: 5,
                  child: Container(
                    child: Column(
                      children: [
                        Flexible(
                          flex: 1,
                          child: Container(
                            color: Colors.deepPurple,
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Container(
                            color: Colors.black,
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Container(
                            color: Colors.deepOrangeAccent,
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Container(
                            color: Colors.black,
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Container(
                            color: Colors.cyan,
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
