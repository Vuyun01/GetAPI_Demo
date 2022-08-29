import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lesson3_api/getdatas.dart';
import 'package:lesson3_api/httpmodel.dart';
import 'package:lesson3_api/model/photos.dart';
import 'package:lesson3_api/screens_api/photos_screen.dart';
import 'package:lesson3_api/screens_api/users/food_screen.dart';
import 'package:lesson3_api/screens_api/users/users_screen.dart';

import 'model/foods.dart';
import 'model/users.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // primaryColor: Colors.white,
        textTheme: Theme.of(context).textTheme.apply(bodyColor: Colors.white),
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Get API'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   DataRequest.fetchFoods();
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Foods>>(
        future: DataRequest.fetchFoods(),
        builder: ((context, snapshot) {
            if(snapshot.hasData == true){
              return FoodList(foods: snapshot.data!,);
            }else if(snapshot.hasError){
              return Center(child: Text("${snapshot.error}"));
            }else{
              return Center(child: CircularProgressIndicator());
            }
          }
        )
      )
    );
  }
}

