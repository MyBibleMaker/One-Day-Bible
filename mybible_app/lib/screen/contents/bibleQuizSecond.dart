import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class QuizSecond extends StatefulWidget {
  @override
  _QuizSecondState createState() => _QuizSecondState();
}



class _QuizSecondState extends State<QuizSecond> {
  String quiz, answer, check1, check2, check3, check4;
  bool state1, state2,state3,state4;

  Future fetchPost() async {
    String server;
    server = "http://192.119.129.106:8000/quiz";
    await Future.delayed(Duration(seconds: 0));
    final response = await http.get(Uri.parse(server));
    var temp = jsonDecode(response.body);
    print(temp);
    //temp = utf8.decode(temp);
    String problem =utf8.decode(temp["problem"].toString().codeUnits);
    String ans = utf8.decode(temp["answer"].toString().codeUnits);
    String ch1 = utf8.decode(temp["distractor"][0].toString().codeUnits);
    String ch2 = utf8.decode(temp["distractor"][1].toString().codeUnits);
    String ch3 = utf8.decode(temp["distractor"][2].toString().codeUnits);
    String ch4 = utf8.decode(temp["distractor"][3].toString().codeUnits);

    setState(() {
      quiz = problem;
      answer = ans;
      check1 = ch1;
      check2 = ch2;
      check3 = ch3;
      check4 = ch4;
      state1 = false;
      state2 = false;
      state3 = false;
      state4 = false;
    });
  }


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

    state1 = false;
    state2 = false;
    state3 = false;
    state4 = false;
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
                          child: InkWell(
                            child: state1 ? Container(
                              color: Colors.amberAccent,
                              child: Row(
                                children: [
                                  SizedBox(width: 20,height: 1000,),
                                  Text("1. $check1",style:TextStyle(fontSize: 20) ,),
                                ],
                              ),
                            ): Container(
                              color: Colors.white,
                              child: Row(
                                children: [
                                  SizedBox(width: 20,height: 1000,),
                                  Text("1. $check1",style:TextStyle(fontSize: 20) ,),
                                ],
                              ),
                            ),
                            onTap: (){
                              setState(() {
                                state1 = true;
                                state2 = false;
                                state3= false;
                                state4= false;
                              });
                            },
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: InkWell(
                            child: state2 ? Container(
                              color: Colors.amberAccent,
                              child: Row(
                                children: [
                                  SizedBox(width: 20,height: 1000,),
                                  Text("2. $check2",style:TextStyle(fontSize: 20) ,),
                                ],
                              ),
                            ): Container(
                              color: Colors.white,
                              child: Row(
                                children: [
                                  SizedBox(width: 20,height: 1000,),
                                  Text("2. $check2",style:TextStyle(fontSize: 20) ,),
                                ],
                              ),
                            ),
                            onTap: (){
                              setState(() {
                                state2 = true;
                                state1 = false;
                                state3= false;
                                state4= false;
                              });
                            },
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: InkWell(
                            child: state3 ? Container(
                              color: Colors.amberAccent,
                              child: Row(
                                children: [
                                  SizedBox(width: 20,height: 1000,),
                                  Text("3. $check3",style:TextStyle(fontSize: 20) ,),
                                ],
                              ),
                            ): Container(
                              color: Colors.white,
                              child: Row(
                                children: [
                                  SizedBox(width: 20,height: 1000,),
                                  Text("3. $check3",style:TextStyle(fontSize: 20) ,),
                                ],
                              ),
                            ),
                            onTap: (){
                              setState(() {
                                state3 = true;
                                state1 = false;
                                state2= false;
                                state4= false;
                              });
                            },
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: InkWell(
                            child: state4 ? Container(
                              color: Colors.amberAccent,
                              child: Row(
                                children: [
                                  SizedBox(width: 20,height: 1000,),
                                  Text("4. $check4",style:TextStyle(fontSize: 20) ,),
                                ],
                              ),
                            ): Container(
                              color: Colors.white,
                              child: Row(
                                children: [
                                  SizedBox(width: 20,height: 1000,),
                                  Text("4. $check4",style:TextStyle(fontSize: 20) ,),
                                ],
                              ),
                            ),
                            onTap: (){
                              setState(() {
                                state4 = true;
                                state1 = false;
                                state3= false;
                                state2= false;
                              });
                            },
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Container(
                            child: Center(
                              child: InkWell(
                                child: Text("확인", style: TextStyle(fontSize: 27, fontWeight: FontWeight.w200),),
                                onTap: (){
                                  if(state1 == false &&state2 == false &&state3 == false &&state4 == false){
                                    print("예외");
                                  }
                                  else{
                                    if(state1 == true){
                                      CheckDialog(answer, check1);
                                    }
                                    else if(state2 == true){
                                      CheckDialog(answer, check2);
                                    }
                                    else if(state3 == true){
                                      CheckDialog(answer, check3);
                                    }
                                    else if(state4 == true){
                                      CheckDialog(answer, check4);
                                    }
                                  }
                                },
                              ),
                            ),
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
  void CheckDialog(String answer, String check) {
    showDialog(
        context: context,
        //barrierDismissible - Dialog를 제외한 다른 화면 터치 x
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            // RoundedRectangleBorder - Dialog 화면 모서리 둥글게 조절
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            //Dialog Main Title
            title: Column(
              children: <Widget>[
                new Text("정답은?", style: TextStyle(fontSize: 20),),
              ],
            ),
            //
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                answer == check ?Text(
                  "정답입니다!!",
                ):Text(
                  "틀렸습니다! 정답은 \"$answer\"입니다!",
                ),
              ],
            ),
            actions: <Widget>[
              new FlatButton(
                child: new Text("확인"),
                onPressed: () {
                  fetchPost();
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }
}
