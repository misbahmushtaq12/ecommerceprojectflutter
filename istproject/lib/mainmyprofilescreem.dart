import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:istproject/intropage.dart';
import 'package:istproject/myprofilescreen.dart';
import 'package:istproject/splashscreen.dart';
import 'package:istproject/widgets/roundedbtn.dart';

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
  var nameController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:Text('Dashboard'),
      ),
      body:Center(
        child: Container(width: 300,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
                Text('Welcome',style:TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.bold
                ),),
                SizedBox(height:11),
                TextField(
                  controller: nameController,
                ),
                SizedBox(height:11),
                ElevatedButton(onPressed: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context)=> MyProfilescreen(nameController.text.toString())));
                }, child:Text('My Profile'))
              ]
          ),
        ),
      ),
    );
  }
}



