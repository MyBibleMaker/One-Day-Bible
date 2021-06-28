import 'package:flutter/material.dart';
import 'package:mybible_app/Api/Provider.dart';
import 'package:mybible_app/screen/contents/bibleStory.dart';

class StorySecond extends StatefulWidget {
  String a, b;

  StorySecond(Provider data) {
    a = data.storyTitle;
    b = data.storyValue;
  }

  @override
  _StorySecondState createState() => _StorySecondState(a, b);
}

class _StorySecondState extends State<StorySecond> {
  int index;
  String storyTitle;
  String storyValue;
  Map<String, dynamic> list = {
    "1": [
      "맨 처음 하나님이 홀로 계시고 세상은 텅 비어 어둠과 물만 있었습니다. \"빛이 있으라\" 하나님이 말씀하시자 세상은 빛으로 가득 찼고, 밝음은 낮으로, 어두움은 밤이라 이름 지으셨습니다.",
      "물은 바다와 하늘의 물로 나누시고 육지를 드러나게 하시며 나무와 풀이 자라나게 하셨습니다.\n하늘은 해와 달 별로 채우시고 물 속에는 각종 물고기와 공중에는 온갖 나는 것들로 만드셨습니다.\n숲에는 기는 짐승과 작은 벌레까지 살게 하셨지요.",
      "마지막에는 이 모든 세상을 다스리도록 하나님을 닮은 남자와 여자를 만드시고 축복 하셨습니다.\n이 모든 것을 엿새동안 만드시고 일곱째 날에는 쉬셨습니다."
    ],
    "2": [
      "어느 날 예수님은 마을에서 멀리 떨어진 광야(사막)에서 말씀을 전하고 계셨습니다. 많은 사람들은 점점 모여들어 남자만해도 약 오천 명이나 되었습니다.\n해가 서산에 질 무렵 모두들 배가 고파오기 시작했습니다.\n\n\"저 사람들에게 먹을 것을 주어라.\" 예수님의 말씀에 제자들이 물었습니다. \"돈도 없고, 돈이 있어도 이 곳은 먹을 것을 살 곳도 없습니다.\"",
      "그때 제자중 안드레아가 군중 속으로 달려가서 소리쳤습니다.\n\"누구, 먹을 것이 있느냐.\" 어느 소년이 \"생선 두 마리와 보리떡 다섯덩이\"를 싼 도시락을 가져왔습니다.\n\"주여 이것 밖에 없나이다.\" 예수님은 이 도시락 위에 손을 얹고 축복의 기도를 드렸습니다.\n\"이 떡과 생선을 저들에게 나누어주어라\" 제자들은 예수님이 시키시는대로 나누어주자 음식은 배고픈 무리들이 배불리 먹기에 충분하게 되었지요 .",
      "\"먹고 남은 부스러기를 모아 보아라\" 예수님의 명령에 모두 남은 부스러기를 모으자, 모두 12바구니나 되었고, 이 놀라운 일은 사람들의 입을 통해 전해지기 시작했답니다."
    ]
  };

  _StorySecondState(String title, value) {
    print(title);
    print(value);
    storyTitle = title;
    storyValue = value;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    index = 0;
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
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 80,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                        icon: Icon(Icons.arrow_left),
                        onPressed: () {
                          setState(() {
                            index > 0? index--: index =2;
                          });
                        }),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.4,
                      width: MediaQuery.of(context).size.width * 0.75,
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
                                    storyTitle,
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.02,
                                        fontWeight: FontWeight.w100),
                                  ),
                                ],
                              ),
                            ),
                            // 그림 넣을 곳
                            Flexible(
                              flex: 8,
                              child: Container(
                                height: 300,
                                width: 300,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    alignment: Alignment.center,
                                    image: AssetImage(
                                      "image/story${storyValue}_${index+1}.png",
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            // 메뉴에 대한 설명
                          ],
                        ),
                      ),
                    ),
                    IconButton(
                        icon: Icon(Icons.arrow_right),
                        onPressed: () {
                          setState(() {
                            index < 2? index++: index = 0;
                          });
                        }),
                  ],
                ),
              ),
              SizedBox(
                height: 80,
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Text(
                    list[storyValue][index],
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * 0.02),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
