import 'package:flutter/material.dart';

class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  int pageNum = 0;

  List<Map<String, String>> menuInform = [
    {"title": "성경 말씀", "pic": "", "context": "원하는 구절을 찾아보세요!"}];

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
                IconButton(icon: Icon(Icons.arrow_left), onPressed: () {}),
                InkWell(
                  child: Container(
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * 0.6,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * 0.7,
                    child: Card(
                      elevation: 5,
                      child: Column(
                        children: [
                          //메뉴의 제목
                          Flexible(
                            flex: 1,
                            child: Container(
                              color: Colors.black,
                            ),
                          ),
                          // 그림 넣을 곳
                          Flexible(
                              flex: 5,
                              child: Container(
                                color: Colors.blue,
                              )),
                          // 메뉴에 대한 설명
                          Flexible(
                              flex: 1,
                              child: Container(
                                child: Text(menuInform[pageNum]["context"]),
                              )),
                        ],
                      ),
                    ),
                  ),
                ),
                IconButton(icon: Icon(Icons.arrow_right), onPressed: () {}),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
