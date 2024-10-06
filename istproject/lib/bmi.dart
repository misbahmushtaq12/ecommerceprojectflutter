import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
  var wtController=TextEditingController();
  var ftController=TextEditingController();
  var inController=TextEditingController();
  var result="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:AppBar(
          backgroundColor: Colors.cyan,
          title:Text('bmi'),

        ),
        body:Center(
          child: Container(width: 400,
            color:Colors.indigo.shade200,
            child: Column(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('BMI',style: TextStyle(fontSize: 34,fontWeight: FontWeight.w700),),
                TextField(
                  controller: wtController,
                  decoration: InputDecoration(
                      label: Text('enter weight in kg'),
                      prefixIcon: Icon(Icons.line_weight)
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 21,),
                TextField(
                  controller:ftController,
                  decoration:InputDecoration(
                      hintText: 'enter height in feet',
                      prefixIcon: Icon(Icons.height)
                  ),
                  keyboardType: TextInputType.number,
                ),

                SizedBox(height: 21,),
                TextField(
                  controller:inController,
                  decoration: InputDecoration(
                    label:Text('enter height in inches'),
                    prefixIcon: Icon(Icons.height),
                  ),keyboardType: TextInputType.number,
                ),
                ElevatedButton(onPressed: (){
                  var wt=wtController.text.toString();
                  var ft=ftController.text.toString();
                  var inch=inController.text.toString();

                  if(wt!="" &&ft!= "" && inch!=""){
                    var iwt=int.parse(wt);
                    var ift=int.parse(ft);
                    var iinch=int.parse(inch);
                    var tinch=(ift*12)*iinch;
                    var tcm=tinch*2.54;
                    var tm=tcm/100;
                    var bmi=iwt/(tm*tm);
                    var msg ="";
                    if(bmi>25){
                      msg="you are overweight";
                    }
                    else if(bmi<18){
                      msg="you are underweight";
                    }
                    else
                      msg="you are healthy";
                    result='$msg your bmi is $bmi';
                    setState(() {
                      result='$msg your bmi is ${bmi.toStringAsFixed(3)}';
                    });
                  }
                  else {
                    setState(() {
                      result="please fill all mentioned details";
                    });

                  }

                }, child:Text('calculate')),
                Text(result,style: TextStyle(fontSize: 19),)
              ],
            ),
          ),
        )

    );

  }
}