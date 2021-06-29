import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mybible_app/Api/api.dart';
import 'package:flutter/widgets.dart';

List<String> _chaplist=["1장"];
List<String> _vers=["1절"];

int selec_inedx=0;
String book=null;

List<List<int>> profile=[
  [4,22,23,18,22],
  [1,21],
  [4,30,30,21,23],
  [3,12,17,18]
];

class Word extends StatefulWidget {
  @override
  _WordState createState() => _WordState();
}

class _WordState extends State<Word> {
  @override
  Widget build(BuildContext context) {
    List<String> post_bible=['룻기','오바댜'];
    List<String> past_bible=['빌립보서','데살로니가후서'];
    Size size =MediaQuery.of(context).size;
    final Controller =TextEditingController();
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
          actions: [
            new IconButton(
                onPressed: (){
                  Navigator.of(context).push(_createRoute());
                }, icon: Icon(Icons.search))
          ],
          title: Text(
            "말씀",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Column(
          children: [
            // Container(
            //   height: size.height*0.1,
            //   child: Stack(
            //     children: [
            //       Container(
            //         height: size.height*0.09-32,
            //         decoration: BoxDecoration(
            //             color: Colors.grey,
            //             borderRadius: BorderRadius.only(
            //               bottomLeft:Radius.circular(26),
            //               bottomRight:Radius.circular(26),
            //             )
            //         ),
            //       ),
            //      // Positioned(
            //      //   bottom: 0,
            //      //   left: 0,
            //      //   right: 0,
            //      //   child:Container(
            //      //     margin: EdgeInsets.symmetric(horizontal: 10),
            //      //     height: 54,
            //      //     decoration: BoxDecoration(
            //      //       color: Colors.white,
            //      //       borderRadius: BorderRadius.circular(20),
            //      //       boxShadow: [
            //      //         BoxShadow(
            //      //           offset: Offset(0,4),
            //      //            blurRadius:50,
            //      //           color: Colors.grey
            //      //         )
            //      //       ]
            //      //     ),
            //      //     child: TextField(
            //      //       decoration: InputDecoration(
            //      //         hintText: "   Search",
            //      //         hintStyle: TextStyle(color: Colors.black),
            //      //        enabledBorder: InputBorder.none,
            //      //        focusedBorder: InputBorder.none,
            //      //       ),
            //      //     ),
            //      //   ),)
            //     ],
            //   ),
            // ),

           Flexible(
             flex: 2,
             child:  Row(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Text(" 구약",
                   style: TextStyle(
                   fontSize: 30,
                     fontWeight: FontWeight.bold
                 ),)
               ],
             ),
           ),
            SizedBox(
              height: 10,
            ),
            Divider( thickness: 2, color: Colors.grey, ),
            Flexible(
              flex: 5,
                child:ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: post_bible.length,
                    itemBuilder: (BuildContext context, int index){
                      return Container(
                        width: 150,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("image/bible.png"),
                            )
                        ),
                        child: InkWell(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Center(
                                child: Text("${post_bible[index]}",
                                  style:TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),),
                              )
                            ],
                          ),
                          onTap: (){
                            Navigator.push(context,
                                MaterialPageRoute(
                                    builder: (context)=> Bible_page(context,post_bible[index])));
                          },
                        ),
                      );
                    }
                )),
            SizedBox(
              height: 10,
            ),
            Flexible(
              flex: 2,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(" 신약",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold
                    ),)
                ],
              ),
            ),
            Divider( thickness: 2, color: Colors.grey, ),
            SizedBox(
              height: 10,
            ),
            Flexible(
                flex: 5,
                child:ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: past_bible.length,
                    itemBuilder: (BuildContext context, int index){
                      return Container(
                        width: 150,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("image/bible.png"),
                            )
                        ),
                        child: InkWell(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Center(
                                child: Text("${past_bible[index]}",
                                  style:TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),),
                              )
                            ],
                          ),
                          onTap: (){
                            Navigator.push(context,
                                MaterialPageRoute(
                                    builder: (context)=> Bible_page(context,past_bible[index])));
                          },
                        ),
                      );
                    }
                )
            ),
      ]),
    )
    );

  }

  Route _createRoute(){
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => Serchpage(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(0.0, 1.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  void listset(String name){
    Selec(name);
    _chaplist.removeRange(0, _chaplist.length);
    for(int i=1;i<profile[selec_inedx][0]+1;++i){
      _chaplist.add("${i}장");
    }
  }

  Widget Serch_page(){
    String _chosenValue=null;
    final _namelist=["룻기","오바댜","빌립보서","데살로니가후서"];
    var _selccap="1장";
    var _selc="룻기";
    return MaterialApp(
      theme: ThemeData(
          appBarTheme: AppBarTheme(
              backgroundColor: Colors.grey,
              iconTheme: IconThemeData(
                  color: Colors.white
              )
          )
      ),
      home: Scaffold(
        appBar:AppBar(
        elevation: 0,
        leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            }, icon: Icon(Icons.arrow_back)),
        title: Text("검색",
          style: TextStyle(color: Colors.white),),
      ),
        body: Column(
          children: [
            Flexible(
              flex: 1,
                child: Row(
                  children: [
                    Flexible(
                        flex:3,
                        child:DropdownButton(
                        value: _selc,
                          items: _namelist.map(
                                  (value) {
                                    return DropdownMenuItem(
                                        value: value,
                                        child: Text(value));
                                  }).toList(),
                          onChanged: (value){
                          setState(() {
                            _selc=value;
                            listset(value);
                            print(_chaplist);
                            print(value);
                          });
                          },
                        ),
                ),
                    Flexible(
                        flex:3,
                        child: Center(
                          child: DropdownButton(
                            value: _selccap,
                            items: _chaplist.map(
                                    (value) {
                                  return DropdownMenuItem(
                                      value: value,
                                      child: Text(value));
                                }).toList(),
                            onChanged: (value){
                              setState(() {
                                _selccap=value;
                                print(value);
                              });
                            },
                          ),
                        )),
                    Flexible(
                        flex:3,
                        child: Container()),
                  ],
                )),
            Flexible(
                flex: 4,
                child: Container()),
            Flexible(
                flex: 4,
                child: Container()),
          ],
        ),
      ),
    );
  }

  Widget Bible_page(BuildContext context, String name){
    Selec(name);
    return MaterialApp(
      theme: ThemeData(
          appBarTheme: AppBarTheme(
              backgroundColor: Colors.grey,
              iconTheme: IconThemeData(
                  color: Colors.white
              )
          )
      ),
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
              onPressed: (){
                Navigator.pop(context);
              }, icon: Icon(Icons.arrow_back)),
          title: Text(name,
            style: TextStyle(color: Colors.white),),
        ),
        body:ListView.builder(
            itemCount: profile[selec_inedx][0],
            itemBuilder: (context, index){
              return ListTile(
                title: Text(name+(index+1).toString()+"장"),
                trailing: IconButton(
                  icon: Icon(
                    Icons.add
                  ),
                  onPressed: (){
                    Navigator.push(context,
                        MaterialPageRoute(
                            builder: (context)=> Seconde_page(name,(index+1).toString())));
                  },
                ),
              );
            })
      ),
    );
  }

  void Selec(String name){
    String result;
    switch(name){
      case "룻기":
        selec_inedx=0;
        book="ruth";break;
      case "오바댜":
        selec_inedx=1;
        book="obad";break;
      case "빌립보서":
        selec_inedx=2;
        book="phi";break;
      case "데살로니가후서":
        selec_inedx=3;
        book="2th";break;
    }

  }

  Widget Seconde_page(name,bible_index){
    return MaterialApp(
      theme: ThemeData(
          appBarTheme: AppBarTheme(
              backgroundColor: Colors.grey,
              iconTheme: IconThemeData(
                  color: Colors.white
              )
          )
      ),
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
              onPressed: (){
                Navigator.pop(context);
              }, icon: Icon(Icons.arrow_back)),
          title: Text(name+bible_index+"장",
            style: TextStyle(color: Colors.white),),
        ),
        body: FutureBuilder(
          future: Api().getBibleWord(book, bible_index, "0",profile[selec_inedx][int.parse(bible_index)].toString()),
          builder: (BuildContext contest,AsyncSnapshot snapshot){

           if(snapshot.hasData){
             return ListView.builder(
                 itemCount: profile[selec_inedx][int.parse(bible_index)]-1,
                 itemBuilder: (contest,index){
                   return ListTile(
                     title: Text(snapshot.data[index].toString()),
                   );
                 });
           }
           else{
             return Center(child: CupertinoActivityIndicator());
           }
          } ,
        ),
      ),
    );
  }

}

class Serchpage extends StatefulWidget {
  @override
  _SerchpageState createState() => _SerchpageState();
}

class _SerchpageState extends State<Serchpage> {
  Word word = new Word();
  String _chosenValue=null;

  final _namelist=["룻기","오바댜","빌립보서","데살로니가후서"];
  var _selccap="1장";
  var _selc="룻기";
  var _selcver="1절";
  @override
  Widget build(BuildContext context) {
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
            "검색",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Column(
          children: [
            Flexible(
                flex: 1,
                child: Row(
                  children: [
                    Flexible(
                      flex:4,
                      child:Center(
                        child: DropdownButton(
                          value: _selc,
                          items: _namelist.map(
                                  (value) {
                                return DropdownMenuItem(
                                    value: value,
                                    child: Text(value));
                              }).toList(),
                          onChanged: (value){
                            setState(() {
                              _selc=value;
                              listset(value);
                              //print(_chaplist);
                              print(_selc);
                            });
                          },
                        ),
                      )
                    ),
                    Flexible(
                        flex:3,
                        child: Center(
                          child: DropdownButton(
                            value: _selccap,
                            items: _chaplist.map(
                                    (value) {
                                  return DropdownMenuItem(
                                      value: value,
                                      child: Text(value));
                                }).toList(),
                            onChanged: (value){
                              setState(() {
                                _selccap=value;
                                String ch= value.toString();
                                versset(int.parse(ch.substring(0,ch.indexOf("장"))));
                                print(_selccap);
                              });
                            },
                          ),
                        )),
                    Flexible(
                        flex:3,
                        child: Center(
                          child: DropdownButton(
                            value: _selcver,
                            items: _vers.map(
                                    (value) {
                                  return DropdownMenuItem(
                                      value: value,
                                      child: Text(value));
                                }).toList(),
                            onChanged: (value){
                              setState(() {
                                _selcver=value;
                                // String ch= value.toString();
                                // versset(int.parse(ch.substring(0,ch.indexOf("장"))));
                                print(_selcver);
                              });
                            },
                          ),
                        )),
                  ],
                )),
          Divider( thickness: 2, color: Colors.grey, ),
            Flexible(
                flex: 5,
                child: FutureBuilder(
                  future: Api().getBibleWord(book, _selccap.substring(0,_selccap.indexOf("장")),
                      _selcver.substring(0,_selcver.indexOf("절")),_selcver.substring(0,_selcver.indexOf("절"))),
                  builder: (BuildContext context,AsyncSnapshot snapshot){
                    if(snapshot.hasData){
                      return ListView.builder(
                         itemCount: snapshot.data.length,
                          itemBuilder: (context,index){
                           return ListTile(
                             title: Text(snapshot.data[index].toString()),
                           );
                          });
                    }
                    else{
                      return Center(child: CupertinoActivityIndicator());
                    }
                  },
                )),
            Flexible(
                flex: 5,
                child: Container()),
          ],
        ),
      ),
    );
  }

  void versset(int num){
    _vers.removeRange(0, _vers.length);
    for(int i=1;i<profile[selec_inedx][num]+1;++i){
      _vers.add("${i}절");
    }
  }

  void listset(String name){
    Selec(name);
    _chaplist.removeRange(0, _chaplist.length);
    for(int i=1;i<profile[selec_inedx][0]+1;++i){
      _chaplist.add("${i}장");
    }
  }

  void Selec(String name){
    String result;
    switch(name){
      case "룻기":
        selec_inedx=0;
        book="ruth";break;
      case "오바댜":
        selec_inedx=1;
        book="obad";break;
      case "빌립보서":
        selec_inedx=2;
        book="phi";break;
      case "데살로니가후서":
        selec_inedx=3;
        book="2th";break;
    }

  }
}


class CustomShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    double height = size.height;
    double width = size.width;
    path.lineTo(0, height - 30);
    path.quadraticBezierTo(width /1, height, width, height - 50);
    path.lineTo(width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

