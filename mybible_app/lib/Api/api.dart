import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html_unescape/html_unescape.dart';
import 'package:html/parser.dart' show parse;
import 'package:html/dom.dart';
import 'package:html/dom_parsing.dart';


//http://ibibles.net/quote.php?kor-mat/5:3-12

class Api {
  var url = Uri.parse("http://ibibles.net/quote.php?kor-mat/5:3-12");

  var response;
  int max_index = 22;
  Map<String, dynamic> result = {};
  List<String> lis = List<String>();


  //오늘의 말씀
  Future<Map<String, dynamic>> getTodayWord() async {
    response = await http.get(url).timeout(const Duration(seconds: 3));
    result = json.decode(response.body);
    return result;
  }


  //성경 말씀
  Future<List<String>> getBibleWord(String book_name, String starting_chapter,
      String starting_verse, String ending_verse) async {
    String parses = "http://ibibles.net/quote.php?kor-" + book_name + "/" +
        starting_chapter + ":" + starting_verse + "-" + ending_verse;
    var url = Uri.parse(parses);
    var response = await http.get(url);
    var result = response.body;
    var docu = parse(response.body);
    var view = docu.querySelectorAll("body");

    for (var e in view)
      result = e.text;

    int end = (int.parse(ending_verse));
    int start = int.parse(starting_verse);

    if (starting_verse == '0') {
      for (int i = 1; i < 23; i++) {
        if (i == end - 1) {
          lis.add(result.substring(
            result.indexOf((starting_chapter + ':' + (i).toString())),));
          return lis;
        }
        lis.add(result.substring(
            result.indexOf((starting_chapter + ':' + i.toString())),
            result.indexOf(starting_chapter + ':' + (i + 1).toString())));
      }
      return lis;
    }
    else {
      if (starting_verse == ending_verse) {
        int eindex = result.indexOf(starting_chapter + ':' + ending_verse);
        lis.add(result.substring(
            result.indexOf(starting_chapter + ':' + starting_verse, eindex)));
        return lis;
      }
      for (int i = start; i < end; i++) {
        if (i == end - 1) {
          lis.add(result.substring(
            result.indexOf((starting_chapter + ':' + (i).toString())),));
          return lis;
        }
        lis.add(result.substring(
            result.indexOf((starting_chapter + ':' + i.toString())),
            result.indexOf(starting_chapter + ':' + (i + 1).toString())));
      }

      //print(lis);
      return lis;
    }
  }

// void selecting(String book_name){
//   switch(book_name){
//     case "룻기":
//       //4
//       max_index=;break;
//     case "오바댜":
//       //1
//       max_index=;break;
//     case "빌립보서":
//       //4
//       max_index=;break;
//     case "데살로니가후서":
//       //3
//       max_index=;break;
//   }

}