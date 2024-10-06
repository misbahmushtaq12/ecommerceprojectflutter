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
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.cyan,
        title:Text('heroanimation'),

      ),
      body: Center(
        child: InkWell(onTap: (){Navigator.push(context,
            MaterialPageRoute(builder: (context)=>DetailPage(),));
        },
            child:Hero(
              tag: 'background',
              child:  Container(width: 150,height: 100,color: Colors.red,),
            )
        ),
      ),
    );


  }
}

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar:AppBar(
          backgroundColor: Colors.cyan,
          title:Text('opacitywidget'),
        ),
        body:Hero(
          tag: 'background',
          child: Container(width: 400,height: 200,color: Colors.pink,),
        )
    );
  }
}