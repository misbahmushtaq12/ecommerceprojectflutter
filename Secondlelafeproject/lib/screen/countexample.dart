import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/Countprovider.dart';

class CounterExample extends StatefulWidget {  @override
  State<CounterExample> createState() => _CounterExampleState();
}

class _CounterExampleState extends State<CounterExample> {
  @override
  Widget build(BuildContext context) {
    final countprovider=Provider.of<CountProvider>(context,listen:false);
    return Scaffold(
      body:Consumer<CountProvider>(builder: (context,value,child){
        return
            Center(child: Text(value.count.toString()));
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          countprovider.setcount();
        },child: Icon(Icons.add),
      ),
    );
  }}
