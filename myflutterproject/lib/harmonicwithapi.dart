import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:myflutterproject/detailpage.dart';
import 'package:myflutterproject/searchpage.dart';
import 'package:myflutterproject/settingspage.dart';

import 'Model/Postmodel.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {




  List<String> listdata = [
    "Top Stories",
    "Last 24 hours",
    "Last 48 hours",
    "Last Week",
    "New Stories",
    "Best Stories",
    "Ask HN ",
    "Show HN",
    "HN jobs",
    "Bookmarks"
  ];
  String selectedopt = "Top Stories";
  List<Postmodel> postList=[];
  Future<List<Postmodel>> getPostApi() async {
    try{
      final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

      print("helloj");
      if (response.statusCode == 200) {
        var data = json.decode(response.body.toString());
        for(Map i in data){

          postList.add(Postmodel.fromJson(i));
        }
        print("hello");
        return postList;
      } else {

        return postList;
      }}catch(e){
      print("error ,$e");
      return postList;}

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child:
          Column(children: [
            Container(
              child: Row(
                children: [
                  SizedBox(
                    height: 50,
                    child: DropdownButton<String>(
                      value: selectedopt,
                      onChanged: (newvalue) {
                        setState(() {
                          selectedopt = newvalue!;
                        });
                      },
                      items: listdata.map((item) {
                        return DropdownMenuItem(
                          child: Text(
                            item + "    ",
                            style: TextStyle(
                              fontWeight: selectedopt == item
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                              fontSize: selectedopt == item ? 35 : 20,
                            ),
                          ),
                          value: item,
                        );
                      }).toList(),
                    ),
                  ),
                  InkWell(
                    onTap: () {//Searchpage();
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Searchpage()));
                    },
                    child: SizedBox(width: 75, child: Icon(Icons.search)),
                  ),
                  PopupMenuButton(
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        child: Text('Log in'),
                      ),
                      PopupMenuItem(
                        child: Text('Settings'),
                        onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>settingspage()));

                          // Navigate to the settings page
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              child: FutureBuilder(
                future: getPostApi(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Text("loading");
                  } else  {
                    return ListView.builder(physics: NeverScrollableScrollPhysics(),shrinkWrap:true,itemBuilder: (context,index){
                      return ListTile(
                       // onTap:() {Navigator.push(context,MaterialPageRoute(builder:(context)=>DetailProduct()));},
                        leading: Text(postList[index].userId.toString()),
                      );
                    },itemCount: postList.length,);
                  }
                },
              ),
            ),
          ],
          )


      ),
    );
  }
}
class AlbumItem {
  String title;

  AlbumItem({required this.title});
}