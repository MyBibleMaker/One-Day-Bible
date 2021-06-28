import 'package:flutter/material.dart';
import 'package:mybible_app/screen/contents/all_screen.dart';
import 'package:mybible_app/screen/contents/bibleQuiz.dart';
import 'package:mybible_app/screen/contents/bibleStory.dart';
import 'package:mybible_app/screen/contents/bibleWord.dart';
import 'package:mybible_app/screen/contents/bibleQuizSecond.dart';
import 'package:mybible_app/screen/contents/More_story.dart';

class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  int pageNum = 0;

  ///1. 성경 찾기
  ///1-2. 오늘의 말씀..?
  ///2. 성경 퀴즈
  ///3. 성경 이야기
  ///4. 수정이네 말씀카드로 할만한 것

  List<Map<String, String>> menuInform = [
    {"title": "성경 말씀", "pic": "", "context": "원하는 구절을 찾아보세요!"},
    {"title": "성경 퀴즈", "pic": "", "context": "성경을 얼마나 알고 있나요?"},
    {"title": "성경 이야기", "pic": "", "context": "쉬운 성경 이야기"},
    {"title": "성경 더 알아보기", "pic": "", "context": "성경을 더 알아보자!"},
    //{"title": "아직 생각 중", "pic": "", "context": "?"}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              flex: 1,
                child: Container(
                  height: 100,
              width: 100,
              decoration: BoxDecoration(
                image: DecorationImage(
                  alignment: Alignment.center,
                  image: AssetImage(
                    "image/bible2.jpg",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            )),
            SizedBox(
              height: 80,
            ),
            Flexible(
              flex: 7,
              child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    icon: Icon(Icons.arrow_left),
                    onPressed: () {
                      setState(() {
                        pageNum == 0 ? pageNum = 3 : pageNum--;
                      });
                    }),
                InkWell(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.43,
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: Card(
                      elevation: 5,
                      child: Column(
                        children: [
                          //메뉴의 제목
                          Flexible(
                            flex: 2,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  menuInform[pageNum]["title"],
                                  style: TextStyle(
                                      fontSize:
                                      MediaQuery.of(context).size.height *
                                          0.028,
                                      fontWeight: FontWeight.w100),
                                ),
                              ],
                            ),
                          ),
                          // 그림 넣을 곳
                          Flexible(flex: 8, child:Container(
                            height: 300,
                            width: 300,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                alignment: Alignment.center,
                                image: AssetImage(
                                  "image/bible$pageNum.jpg",
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),),
                          // 메뉴에 대한 설명
                          Flexible(
                              flex: 2,
                              child: Container(
                                child: Text(menuInform[pageNum]["context"]),
                              )),
                        ],
                      ),
                    ),
                  ),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>
                    pageNum == 0 ? Word(): pageNum == 1? Quiz(): pageNum== 2? Story():pageNum==3?More():null
                    ));
                  },
                ),
                IconButton(icon: Icon(Icons.arrow_right), onPressed: () {
                  setState(() {
                    pageNum==3? pageNum=0:pageNum++;
                  });
                }),
              ],
            ),),
            SizedBox(
              height: 80,
            ),
            Flexible(
              flex: 1,
                child: IconButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>All_screen()));
                  },
                  icon: Icon(Icons.view_headline),
                  iconSize: 50,
                )),
          ],
        ),
      ),
    );
  }
}
