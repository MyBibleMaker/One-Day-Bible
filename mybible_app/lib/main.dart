import 'package:flutter/material.dart';
import 'package:mybible_app/screen/contents/bibleQuiz.dart';
import 'package:mybible_app/screen/contents/bibleQuizSecond.dart';
import 'package:mybible_app/screen/contents/bibleQuizThird.dart';
import 'screen/menu_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'bible_maker',
      initialRoute: '/',
      theme: ThemeData(
        fontFamily: "NanumGothic",
        backgroundColor: Colors.white,
      ),
      routes: {
        '/': (context) => StartPage(),
        '/menu': (context) => MenuPage(),
        '/quiz': (context) => Quiz(),
        '/second': (context) => QuizSecond(),
        '/third': (context) => QuizThird(),
      },
    );
  }
}

class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context, '/menu');
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Container(
                  height: MediaQuery.of(context).size.width * 1,
                  width: MediaQuery.of(context).size.width * 1,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      alignment: Alignment.center,
                      image: AssetImage(
                        "image/bible2.jpg",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                  child: Text(
                "내가 진실로 진실로 너희에게 이르노니\n한 알의 밀이 땅에 떨어져 죽지 아니하면\n한 알 그대로 있고 죽으면 많은 열매를 맺느니라\n\n요 12:24",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              )),
            ),
          ),
        ],
      )),
    );
  }
}
