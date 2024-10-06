import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;


class MyHomePage extends StatefulWidget {
  final String title;
  const MyHomePage({super.key, required this.title});
  @override
  State<MyHomePage> createState()=> _MyHomePageState();

}
class _MyHomePageState extends State<MyHomePage>{
  List <AlbumItem> albumitemlist=[];
  Future <List<AlbumItem>> getitems() async {
    try{
      print("hello");
    final response=await http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));
    var data=jsonDecode(response.body.toString());
    if(response.statusCode==200){
      for(Map i in data){
        AlbumItem albumitem=AlbumItem.fromJson(i);
        albumitemlist.add(albumitem);
      }
      print("hi");
      return albumitemlist;
    }
    else return albumitemlist;

}
  catch(e){
      print(e);
      return albumitemlist;
  }}

  @override

  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
        title: Text('Rest API call'),
    ),
    body:Column(
    children: [
      Expanded(child: FutureBuilder(
    future: getitems(),
    builder: (context,snapshot){
      if(!snapshot.hasData){return Text('loading');}
      else
    {return ListView.builder (
    itemCount:albumitemlist.length,
    itemBuilder:(context,index){
    return ListTile(
    title:Text(albumitemlist[index].title.toString()),
    leading: Text(albumitemlist[index].userid.toString()),
    );
    });
    }})
    )
    ],
    )
    );
  }}

class AlbumItem{
  String title;
  int userid;
  int id;
  AlbumItem({required this.title,required this.userid, required this.id});

  factory AlbumItem.fromJson(Map json) {
    return switch (json) {
      {
      'userId': int userId,
      'id': int id,
      'title': String title,
      } =>
          AlbumItem(
            title: title,
            userid: userId,
            id: id,
          ),
      _ => throw const FormatException('Failed to load album.'),
    };
  }
}

