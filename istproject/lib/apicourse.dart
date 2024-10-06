import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'models/PostModel.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState()=> _MyHomePageState();

}
class _MyHomePageState extends State<MyHomePage>{
  List<PostModel> postlist=[];
  Future<List<PostModel>> getpostapi()async{
    final response =await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    var data=jsonDecode(response.body.toString());
    if (response.statusCode==200)
      {
        for(Map i in data){
          postlist.add(PostModel.fromJson(i));
        }
        return postlist;
      }
    else{return postlist ;}
  }

  @override

Widget build(BuildContext context) {

  return Scaffold(
      appBar: AppBar(
        title: Text('Rest API call'),
      ),
      body:Column(
        children: [
          Expanded(
            child: FutureBuilder(future: getpostapi(),
                builder:(context,snapshot){
              if(!snapshot.hasData){return Text('loading');}
              else{
                return ListView.builder(itemBuilder:(context,index){
                return Text(postlist[index].title.toString());
              },itemCount: postlist.length,
                );}}
          ))
        ],
      )
  );
}
}
