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
      List<String> result = List<String>();
      //ge =창세 exo=출애굽기 ruth=룻기 obad=오바댜
      //mat=마태볶 mark=마가볶음 phi=빌립보서 2th=데살로니가후서
      result=await Api().getBibleWord("ruth", "1", "0", "22");
      print(result);

    });
  });

}
