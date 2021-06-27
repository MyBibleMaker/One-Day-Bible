import 'package:flutter/material.dart';
import 'package:mybible_app/Api/Provider.dart';
import 'package:mybible_app/screen/contents/bibleStory.dart';

class StorySecond extends StatefulWidget {
  String a,b;
  StorySecond(Provider data){
    a =data.storyTitle;
    b = data.storyValue;
  }
  @override
  _StorySecondState createState() => _StorySecondState(a, b);
}

class _StorySecondState extends State<StorySecond> {
  _StorySecondState(String title, value){
    print(title);
    print(value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body:  Container(
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
                        setState(() {});
                      }),
                  InkWell(
                    child: Container(
                      height: MediaQuery
                          .of(context)
                          .size
                          .height * 0.43,
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
                              flex: 2,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "임시 2",
                                    style: TextStyle(
                                        fontSize:
                                        MediaQuery
                                            .of(context)
                                            .size
                                            .height *
                                            0.028,
                                        fontWeight: FontWeight.w100),
                                  ),
                                ],
                              ),
                            ),
                            // 그림 넣을 곳
                            Flexible(flex: 8, child: Container(
                              height: 300,
                              width: 300,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  alignment: Alignment.center,
                                  image: AssetImage(
                                    "image/bible0.jpg",
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),),
                            // 메뉴에 대한 설명
                            Flexible(
                                flex: 2,
                                child: Container(
                                  child: Text("임시"),
                                )),
                          ],
                        ),
                      ),
                    ),
                  ),
                  IconButton(icon: Icon(Icons.arrow_right), onPressed: () {
                    setState(() {

                    });
                  }),
                ],
              ),),
            SizedBox(
              height: 80,
            ),
          ],
        ),
      ),
    );
  }
}
