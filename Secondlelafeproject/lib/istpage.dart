import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:secondlelafeproject/Modules/mymodel.dart';
import 'package:http/http.dart' as http;

class FirstPage extends StatefulWidget {  @override
  State<FirstPage> createState() => _FirstPageState();
}
class _FirstPageState extends State<FirstPage>{
   List<Mymodel>postlist=[];
  Future<List<Mymodel>>getpostapi()
  async {
    final response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    var data = jsonDecode(response.body.toString());
    try {
      if (response.statusCode == 200) {
        for (Map i in data) {
          postlist.add(Mymodel.fromJson(i));
        }
        return postlist;
      } else {
        return postlist;
      }
    }
    catch (e) {
      print('$e');
      return postlist;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        children: [
          Text('Your Home Page',style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold,fontSize: 40),),
          Expanded(
            child: FutureBuilder(future: getpostapi(),
                builder:(context,snapshot){
              if(!snapshot.hasData){return Text('loading');}
              else{return ListView.builder(itemBuilder: (context,index){
                return ListTile(
                  leading: Text(postlist[index].id.toString()),
                title: Text(postlist[index].title.toString()),
                trailing: Icon(Icons.message),);
              },
                itemCount: postlist.length,);
              }
                }
                ),
          )

        ],
      )
      
    );
    
    
  }
}
