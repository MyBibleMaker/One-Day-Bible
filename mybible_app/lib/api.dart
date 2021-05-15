import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;


class Api{
  var url= Uri.parse("http://dasd.com:9090") ;
  var response;
  Map<String,dynamic> result={};


  //오늘의 말씀
  Future<Map<String,dynamic>> getTodayWord() async {
    response= await http.get(url).timeout(const Duration(seconds:3));
    result= json.decode(response.body);
    return result;
  }

  //성경 말씀
  Future<Map<String,dynamic>> getBibleWord() async{
    response=await http.get(url).timeout(const Duration(seconds:3));
    result= json.decode(response.body);
    return result;
  }

}