import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thirdlelafeproject/providers/countprovider.dart';

class Count extends StatefulWidget {  @override
  State<Count> createState() => _CountState();
}

class _CountState extends State<Count> {
  @override
  Widget build(BuildContext context) {
    final countprovider=Provider.of<CountProvider>(context,listen:false);
    return Scaffold(
      body:
        Center(child:
        Consumer<CountProvider>(builder: (context,value,child)
    {
      return
        Text(value.count.toString(), style: TextStyle(fontSize: 80),);
    },),),
          floatingActionButton: FloatingActionButton(child: Icon(Icons.add),
        onPressed: (){

         countprovider.getcount();

    },
    )


    );
  }}
