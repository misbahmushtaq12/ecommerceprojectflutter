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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightGreen),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  int _counter = 0;
  var emailtxt=TextEditingController();
  var passtxt=TextEditingController();

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        appBar: AppBar(
          // TRY THIS: Try changing the color here to a specific color (to
          // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
          // change color while the other colors stay the same.
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        ),
        body:Center(child: Container(
            width:300,
            child: Column(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                    controller: emailtxt,
                    decoration: InputDecoration(
                        focusedBorder:OutlineInputBorder(
                          borderSide:BorderSide(color: Colors.cyan,width:2),
                          borderRadius: BorderRadius.circular(21),),
                        enabledBorder: OutlineInputBorder(
                          borderSide:BorderSide(color: Colors.deepOrange,width:2),
                          borderRadius: BorderRadius.circular(21),),
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(21),
                          borderSide: BorderSide(color: Colors.pink,width:2),),
                        suffixText: "username exists",
                        suffixIcon: IconButton(icon: Icon(Icons.remove_red_eye),color: Colors.pink,
                          onPressed:(){} ,)

                    )),

                Container(height: 11,),
                TextField(
                  keyboardType: TextInputType.phone,
                  obscureText: true,
                  obscuringCharacter: ('*'),
                  controller: passtxt,
                  decoration: InputDecoration(
                      hintText: "enter password",
                      border:OutlineInputBorder(
                          borderSide:BorderSide(color: Colors.cyan),
                          borderRadius: BorderRadius.circular(21)),
                      prefixIcon: Icon(Icons.email,color: Colors.blue,)),

                ),
                ElevatedButton(child: Text('login'),onPressed: (){
                  String uemail=emailtxt.text.toString();
                  String upass=passtxt.text;
                  print("email:$uemail,pass:$upass");
                },)
              ],
            )))

    );
  }
}
