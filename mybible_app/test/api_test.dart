import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:test/test.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mybible_app/Api/api.dart';
import 'package:html_unescape/html_unescape.dart';
void main(){
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.setMockInitialValues({});

  group('api_test',()
  {
    test('bible_api_test',() async{
      // var url= Uri.parse("http://ibibles.net/quote.php?kor-mat/5:3-12") ;
      // var response = await http.get(url);
      // String htmlToParse = response.body;
      String result= await Api().getBibleWord("mat", "5", "3", "12");


    });
  });

}
