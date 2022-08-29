import 'dart:convert';

import 'package:lesson3_api/httpmodel.dart';

import 'model/foods.dart';
import 'model/photos.dart';
import 'package:http/http.dart' as http;

import 'model/users.dart';

class DataRequest{

  //photos
  static Future<List<Photo>> fetchPhotos(http.Client client) async{
    var response =  await client.get(Uri.parse(HttpRequestModel.api));
    if(response.statusCode == 200){
      // return compute(parsePhotos, response.body);
      final List<Map<String, dynamic>> responseParsed = jsonDecode(response.body).cast<Map<String, dynamic>>();
      return responseParsed.map((e) => Photo.fromJson(e)).toList();
    }else{
      throw  Exception("Failed to fetch data from URL");
    }
  }

  //users
  static Future<List<Users>> fetchUsers(http.Client client) async{
    var response =  await client.get(Uri.parse(HttpRequestModel.api));
    if(response.statusCode == 200){
      // return compute(parsePhotos, response.body);
      final List<Map<String, dynamic>> responseParsed = jsonDecode(response.body).cast<Map<String, dynamic>>();
      return responseParsed.map((e) => Users.fromJson(e)).toList();
    }else{
      throw  Exception("Failed to fetch data from URL");
    }
  }

  //food
  // url: 'https://yummly2.p.rapidapi.com/feeds/list',
  // params: {limit: '24', start: '0'},
  // headers: {
  //   'X-RapidAPI-Key': '3a262f2dcdmsha04556f142fa8dep1e3e8bjsn94b5ccd003a0',
  //   'X-RapidAPI-Host': 'yummly2.p.rapidapi.com'
  // }

  static Future<List<Foods>> fetchFoods() async{
    // var response =  await client.get(Uri.parse(HttpRequestModel.api));
    // var url = Uri.parse('https://yummly2.p.rapidapi.com/feeds/list');
    var url = Uri.https('yummly2.p.rapidapi.com', '/feeds/list', {
      'limit': '6', 'start' : '0'
    });
    var response = await http.get(url, headers: {
      'X-RapidAPI-Key': '3a262f2dcdmsha04556f142fa8dep1e3e8bjsn94b5ccd003a0',
      'X-RapidAPI-Host': 'yummly2.p.rapidapi.com'
    });
    if(response.statusCode == 200){
      final Map<String, dynamic> responseParsed = jsonDecode(response.body);
      final List<Map<String, dynamic>> listMapData = [];
      for(var item in responseParsed['feed']){
        listMapData.add(item['content']['details']);
      }
      return listMapData.map((e) => Foods.fromJson(e)).toList();

    }else{
      throw  Exception("Failed to fetch data from URL");
    }
  }
}