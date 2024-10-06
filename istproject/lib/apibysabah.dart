import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
        debugShowCheckedModeBanner: false,
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
  late Future <List<dynamic>> apiresponse;

  @override
  void initState() {
    super.initState();
    apiresponse=fetchusers();



  } //late Future<List<dynamic>> getapicall;

  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text('Rest API call'),
        ),
        body:Column(
          children: [
            Expanded(
              child: FutureBuilder(future: apiresponse,builder: (context,snapshot){
                if(!snapshot.hasData){return Text("Loading.");}
                else{
                  return ListView.builder(
                      itemCount:10,
                      itemBuilder:(context,index){
                        final user=snapshot.data![index];

                        return ListTile(
                          subtitle: Text(user["email"]),
                          // leading:ClipRRect(borderRadius: BorderRadius.circular(100),
                          //   child: Image.network(image)),
                          title: Text(user["name"].toString()),


                        );
                      }
                  );
                }
              },),
            ),
          ],
        )

    );
  }
  Future<List<dynamic>> fetchusers() async{
    print('fetchusers called');
    const url='https://randomuser.me/api/?results=100';
    final uri=Uri.parse(url);
    final response=await http.get(uri);
    try {
      if (response.statusCode == 200) {
        return json.decode(response.body)["results"];
      }
      else {
        return [];
      }
    }catch(e){return [];}

  }
}
