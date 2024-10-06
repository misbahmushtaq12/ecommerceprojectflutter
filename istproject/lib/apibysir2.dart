

import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;


class MyHomePage extends StatefulWidget {
  final String title;
  const MyHomePage({super.key, required this.title,});
  @override
  State<MyHomePage> createState()=> _MyHomePageState();

}
class _MyHomePageState extends State<MyHomePage>{
  List _items=[];
  Future <List<dynamic>> getitems() async {
    try{
      print("hello");
      var response=await http.get(Uri.parse('https://dummyjson.com/products'));
      //var data= await json.decode(response.body)['products'];
      if(response.statusCode==200){
        print("hi");
        return jsonDecode(response.body)['products'];
      }
      else return [];

    }
    catch(e){
      print('cute');
      print(e);
      return  [];
    }}

  @override

  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text('Rest API call'),
        ),
        body:Column(
          children: [
            Expanded(child: FutureBuilder<List<dynamic>>(
                future: getitems(),
                builder: (context,snapshot){
                  if(!snapshot.hasData){return Text('loading');}
                  else
                  {return ListView.builder (
                      itemCount:20,
                      itemBuilder:(context,index){
                        return ListTile(
                          title:Text(snapshot.data![index]['title']),
                          leading: Text(snapshot.data![index]['price'].id.toString()),
                        );
                      });
                  }})
            )
          ],
        )
    );
  }}
