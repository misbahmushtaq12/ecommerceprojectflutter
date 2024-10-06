import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:async';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightGreen),
          useMaterial3: true,
        ),
        home: MyHomePage(title: 'Flutter Demo Home Page')
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState()=> _MyHomePageState();

}
class _MyHomePageState extends State<MyHomePage>{
  bool isfirst=true;
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 4),(){
      reload();
    });
  }
  void reload()
  {
    setState(() {
      isfirst=false;
    });
  }
  Widget build(BuildContext context) {

    return Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.cyan,
        title:Text('opacitywidget'),

      ),
      body:Center(
        child: Column(
          children: [
            AnimatedCrossFade(
                sizeCurve:Curves.fastOutSlowIn ,
                duration: Duration(seconds: 2),
                firstChild: Container(width: 100,height: 200,color: Colors.grey,),
                secondChild: Image.asset('assets/images/ferilizer.png',width: 200,height: 200,
                ),
                crossFadeState: isfirst?CrossFadeState.showFirst:CrossFadeState.showSecond),

          ],
        ),

      ),
    );

  }
}

