import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:secondlelafeproject/main.dart';


class SplashScreen extends StatefulWidget {  @override
  State<SplashScreen> createState()=>_SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen>{
  @override
 void initState() {
    super.initState();
    Timer(Duration(seconds: 3),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const MyHomePage(title: 'Flutter Demo Page')));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(color: Colors.blue,
          child: Center(
              child:Text('Splashscreen',style: TextStyle(fontSize: 34,fontWeight: FontWeight.bold,color:Colors.white),)))
    );

  }

  }