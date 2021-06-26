import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mybible_app/Api/api.dart';

class Word extends StatefulWidget {
  @override
  _WordState createState() => _WordState();
}

class _WordState extends State<Word> {
  
  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    final Controller =TextEditingController();
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
          title: Text("말씀",
            style: TextStyle(color: Colors.white),),
        ),
        body: Column(
          children: [
            Container(
              height: size.height*0.12,
              child: Stack(
                children: [
                  Container(
                    height: size.height*0.12-27,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.only(
                          bottomLeft:Radius.circular(36),
                          bottomRight:Radius.circular(36),
                        )
                    ),
                  ),
                 Positioned(
                   bottom: 0,
                   left: 0,
                   right: 0,
                   child:Container(
                     margin: EdgeInsets.symmetric(horizontal: 10),
                     height: 54,
                     decoration: BoxDecoration(
                       color: Colors.white,
                       borderRadius: BorderRadius.circular(20),
                       boxShadow: [
                         BoxShadow(
                           offset: Offset(0,4),
                            blurRadius:50,
                           color: Colors.grey
                         )
                       ]
                     ),
                     child: TextField(
                       decoration: InputDecoration(
                         hintText: "   Search",
                         hintStyle: TextStyle(color: Colors.black),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                       ),
                     ),
                   ),)
                ],
              ),
            ),
           SizedBox(
             height: 100,
           ),
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
            Flexible(
              flex: 4,
                child:FutureBuilder(
                  future: Api().getBibleWord("","","",""),
                  builder: (BuildContext contest,AsyncSnapshot snapshot){
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: 10,
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
                                Text("<${index}>",
                                  style:TextStyle(
                                      color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),),
                              ],
                            ),
                            onTap: (){
                              Navigator.push(context,
                                  MaterialPageRoute(
                                      builder: (context)=> Bible_page(context,index)));
                            },
                          ),
                        );
                      }
                    );
                  },
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
            SizedBox(
              height: 10,
            ),
            Flexible(
                flex: 4,
                child:FutureBuilder(
                  future: Api().getBibleWord("","","",""),
                  builder: (BuildContext contest,AsyncSnapshot snapshot){
                    return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: 10,
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
                                  Text("<${index}>",
                                    style:TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),),
                                ],
                              ),
                              onTap: (){
                                Navigator.push(context,
                                    MaterialPageRoute(
                                        builder: (context)=> Bible_page(context,index)));
                              },
                            ),
                          );
                        }
                    );
                  },
                )),

      ]),
    )
    );

  }

  Widget Bible_page(BuildContext context, int name){
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
          title: Text("${name}",
            style: TextStyle(color: Colors.white),),
        ),
        body: Center(
          child: Text("das"),
        ),
      ),
    );
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

