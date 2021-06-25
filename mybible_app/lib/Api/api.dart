import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html_unescape/html_unescape.dart';
import 'package:html/parser.dart' show parse;
import 'package:html/dom.dart';
import 'package:html/dom_parsing.dart';


//http://ibibles.net/quote.php?kor-mat/5:3-12

class Api{
  var url= Uri.parse("http://ibibles.net/quote.php?kor-mat/5:3-12") ;
  var response;
  Map<String,dynamic> result={};


  //오늘의 말씀
  Future<Map<String,dynamic>> getTodayWord() async {
    response= await http.get(url).timeout(const Duration(seconds:3));
    result= json.decode(response.body);
    return result;
  }


  //성경 말씀
  Future<String> getBibleWord(String book_name,String starting_chapter,String starting_verse,String ending_verse) async{
    String parses="http://ibibles.net/quote.php?kor-"+book_name+"/"+starting_chapter+":"+starting_verse+"-"+ending_verse;
    var url= Uri.parse(parses);
    var response = await http.get(url);
    var result = response.body;
    var docu = parse(response.body);
    var view= docu.querySelectorAll("body");

    for(var e in view){
      var result=e.text;

    }


    return result;
  }

  void selecting(String text){
    var document = parse(text);

    // var elements= document.getElementsByTagName("br");
    var elements= document.querySelectorAll("body > small");

    print(elements);
  }
}