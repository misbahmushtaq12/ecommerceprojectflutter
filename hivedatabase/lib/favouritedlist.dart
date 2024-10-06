import 'dart:convert';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'modules/PosModel.dart';

class FavouritedList extends StatefulWidget {  @override
  State<FavouritedList> createState() => _FavouritedListState();
}

class _FavouritedListState extends State<FavouritedList> {
  List<PostModel>Postlist=[];
  Future<List<PostModel>>getpostapi()
  async{
    final response=await http.get(Uri.parse('https://fakestoreapi.com/products'));
    var data=jsonDecode(response.body.toString());
    if(response.statusCode==200)
    {
      for (Map i in data){
        Postlist.add(PostModel.fromJson(i));
      }return Postlist;
    }else{
      return Postlist;
    }
  }
  Box ? studentBox;
  @override
  void initState(){
    super.initState();
    studentBox=Hive.box('students');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(width: 370,
        child: FutureBuilder(future: getpostapi(),
            builder:(context,snapshot){
              if(!snapshot.hasData){return Text('Loading');}
              else{
                return
                  ListView.builder(
                    itemBuilder: (context,index)
                    {
                      return Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            IconButton(onPressed: (){


                                setState(() {
                                    studentBox?.deleteAt(index);

                                });
                            }, icon:Icon(Icons.favorite) ),
                            Image.network(Postlist [studentBox?.getAt(index)].image.toString(),height: 300,width: 200,fit: BoxFit.cover,),
                            SizedBox(height: 10,),

                            Container(width:200,
                                child:
                                Text(Postlist [studentBox?.getAt(index)].title.toString(),
                                  style:TextStyle(fontWeight: FontWeight.bold),)),
                            Text('Category:${Postlist [studentBox?.getAt(index)].category.toString()},'),
                          ],
                        ),
                      );
                    },itemCount: studentBox?.length,);
              }
            }
        ),
      )

    );
  }}
