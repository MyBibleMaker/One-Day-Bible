import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class More extends StatefulWidget {
  @override
  _MoreState createState() => _MoreState();
}

class _MoreState extends State<More> {
  @override
  Widget build(BuildContext context) {
    List<String> list=["노선도","한눈 구약","한눈 신약","이스라엘 12지파","선지자"];
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
            "더 알아보기",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: ListView.builder(
          itemCount: 5,
            itemBuilder: (context,index){
            return ListTile(
              title: Text(list[index]),
              trailing: IconButton(
                icon: Icon(Icons.navigate_next),
                onPressed: (){
                  Navigator.push(context,
                      MaterialPageRoute(
                          builder: (context)=> Seconde_page(list[index],index)));
                },
              ),
            );
            }
        ),
        ),
      );
  }

  Widget Seconde_page(String name ,int index){
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
              onPressed: (){
                Navigator.pop(context);
              }, icon: Icon(Icons.arrow_back)),
          title: Text(name,
            style: TextStyle(color: Colors.black),),
        ),
        body: Container(
          child: PhotoView(
            imageProvider: AssetImage("image/more${index}.jpeg"),
            backgroundDecoration: BoxDecoration(
                color: Colors.white
            ),
            minScale: PhotoViewComputedScale.contained * 1,
            maxScale: PhotoViewComputedScale.covered * 2,
            initialScale: PhotoViewComputedScale.contained * 1,
          ),
        ),
      ),
    );
  }
}
