import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:istproject/sliversharmonic.dart';

class searchpage extends StatefulWidget {
  @override
  State <searchpage> createState()=> _searchPageState();}
  class _searchPageState extends State<searchpage>{
    @override
  Widget build(BuildContext context) {
      var searchtext=TextEditingController();
    return Scaffold(
      body:
      Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: TextField(
              controller: searchtext,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                suffixIcon: IconButton(
                  icon:Icon(Icons.clear),
                  onPressed:(){Navigator.pop(context, MaterialPageRoute(builder:(context)=>MyHomePage(title:'its home page')));} ,
                )
              ),
            ),
          ),
          SizedBox(height:50,),
          Icon(Icons.search,size: 80,),
          SizedBox(height: 10,),
          Text("Search for stories",style:TextStyle(fontWeight:FontWeight.bold,fontSize: 25 ),)
        ],
      ),
    );
  }
}
