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
        PostModel postmodel=PostModel(title:i["title"], body:i['string']);
        postlist.add(postmodel);
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
                    builder:(context, AsyncSnapshot<List<PostModel>>Snapshot){
                        return ListView.builder(itemBuilder:(context,index){
                          // return Text(postlist[index].title.toString());
                          //we can write the below like tis alse
                          return Text(Snapshot.data![index].title.toString());
                        },itemCount: postlist.length,
                        );}
                ))
          ],
        )
    );
  }
}
class PostModel{
  String title,body;
  PostModel({required this.title,required this.body});
}