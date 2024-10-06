import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  @override
  State<SecondPage> createState() => _SecondPageState();
}
class _SecondPageState extends State<SecondPage> {
  var clearcontroller=TextEditingController();
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    body: Column(
      children: [
        SizedBox(height: 30,width: 30),
        TextField(
          controller: clearcontroller,
          decoration: InputDecoration(
            hintText:'Search posts',
            prefixIcon: Icon(Icons.search),
            suffixIcon: IconButton(
              icon: Icon(Icons.clear),
              onPressed: (){clearcontroller.clear();}
            )
          ),
        ),
        SizedBox(height: 50),
    Icon(Icons.search,size: 80,),
    SizedBox(height: 10,),
    Text("Search for Trending Posts",style:TextStyle(fontWeight:FontWeight.bold,fontSize: 25 ),)

    ]
    ),
  );
  }
}
