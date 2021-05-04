import 'package:flutter/material.dart';

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
    {"title": "아직 생각 중", "pic": "", "context": "?"}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
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
                    height: MediaQuery.of(context).size.height * 0.6,
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: Card(
                      elevation: 5,
                      child: Column(
                        children: [
                          //메뉴의 제목
                          Flexible(
                            flex: 1,
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
                          Flexible(flex: 8, child: Container()),
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
                    print(pageNum);
                  },
                ),
                IconButton(icon: Icon(Icons.arrow_right), onPressed: () {
                  setState(() {
                    pageNum==3?pageNum=0:pageNum++;
                  });
                }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
