import 'package:flutter/material.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
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
  var myopacity=1.0;
  bool isvisible=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:AppBar(
          backgroundColor: Colors.cyan,
          title:Text('opacitywidget'),
        ),
        body:Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedOpacity(opacity: myopacity,curve: Curves.bounceInOut, duration: Duration(seconds: 2),child:
              Container(
                width: 200,height: 100,color: Colors.blue,
              ),),
              ElevatedButton(onPressed: (){
                setState(() {
                  if(isvisible){
                    myopacity=0.0;
                    isvisible=false;}
                  else{
                    myopacity=1.0;
                    isvisible=true;
                  }
                });
              }, child: Text('close'))
            ],
          ),
        )
    );
  }
}
