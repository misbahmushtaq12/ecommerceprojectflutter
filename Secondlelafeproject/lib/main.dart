import 'package:flutter/material.dart';
import 'package:secondlelafeproject/splashscreen.dart';
import 'mainpage.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen()
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var emailtext=TextEditingController();
  var passtext=TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body:Center(child:Container(width: 300,
        child: Form(
          key: formKey,
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: emailtext,
                decoration: InputDecoration(
                    border:OutlineInputBorder(),
                    labelText:'Enter email'),
                validator: (value){
                  if(value==null|| !value.contains('@')||value.trim().isEmpty){return 'please enter valid text';}
                  else{return null;}
                },
              ),
            TextFormField(
              controller: passtext,
              obscureText: true,
              obscuringCharacter: '*',
              decoration: InputDecoration(
                  border:OutlineInputBorder(),
                  hintText:'enter password'),
            ),
              ElevatedButton(onPressed:(){
                if (formKey.currentState!.validate()) {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>MainPage()));

                }},child: Text('Login',style:TextStyle(color: Colors.green),),)
            ],
          ),
        ),)
      )
    );
  }
}
