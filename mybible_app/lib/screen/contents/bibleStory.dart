import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mybible_app/Api/Provider.dart';
import 'package:mybible_app/screen/contents/bibleStorySecond.dart';

class Story extends StatefulWidget {
  @override
  _StoryState createState() => _StoryState();
}

class _StoryState extends State<Story> {
  @override
  List<Map<String, String>> list = [
    {"title": "하나님이 세상을 만드셨어요", "pic": "story1_1", "value": "1"},
    {"title": "오병이어 이야기", "pic": "story2_1", "value": "2"},
    {"title": "업데이트 예정 ", "pic": "", "value": ""}
  ];

  Widget build(BuildContext context) {
    Provider data = Provider();

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
            "이야기",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Container(
          child: ListView.builder(
            itemCount: 3,
            itemBuilder: (context, index) {
              return Container(
                color: Colors.grey[100],
                height: 102,
                child: Column(
                  children: [
                    InkWell(
                      child: Container(
                        height: 100,
                        color: Colors.white,
                        child: Row(
                          children: [
                            Container(
                              width: 100,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      alignment: Alignment.center,
                                      image: AssetImage(
                                        list[index]["pic"].isEmpty
                                            ? "image/004.png"
                                            : "image/${list[index]["pic"]}.png",
                                      ))),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  child: Text(
                                    list[index]["title"],
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w200,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      onTap: () => list[index]["value"].isEmpty
                          ? print("입력 안됨")
                          : {data.StoryData(list[index]),
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => StorySecond(data))),
                            },
                    ),
                    Container(
                      height: 2,
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

