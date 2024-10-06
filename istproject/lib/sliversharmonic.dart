
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'models/PostModell.dart';



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
 List<PostModell> postList=[];

  Future<List<PostModell>> getPostApi() async {

      print("hi");
      final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

      var data = jsonDecode(response.body.toString());
      print("helloj");
      if (response.statusCode == 200) {
        for(Map i in data){
          postList.add(PostModell.fromJson(i));
        }
        print("hello");
        return postList;
      } else {

        return postList;
      }

  }

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
       child:
      Column(children: [ Container(
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
          onTap: () {
            // Navigate to the search page
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
              onTap: () {
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
    leading: Text(postList[index].userId.toString()),
    );
    },itemCount: 20,);
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


/*import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:istproject/searchpage1.dart';
import 'package:istproject/settingspage.dart';
void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context){
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
  void initState() {
    postdata = getpostapi();
    super.initState();

    }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
  }
  Future<List<dynamic>> getpostapi()async {
    try {
      var response = await http.get(
          Uri.parse('https://dummyjson.com/comments'));
      var data = jsonDecode(response.body.toString());
      if (response.statusCode == 200) {
        return data['comments'];
      }

      else {
        return [];
      }
    } catch (e) {
      print('Error fetching data: $e');
      return [];
    }
  }
  List<String> listdata=[ "Top Stories","Last 24 hours","Last 48hours",
    "Last Week","New Stories", "Best Stories","Ask HN ","Show HN","HN jobs","Bookmarks"];
  String selectedopt="Top Stories";
  List<String> popdata=["Log in","Settings"];
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        //appBar: AppBar(
         // title: Text(widget.title),
       // ),
        body:CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child:
            Row(
              children: [
                SizedBox(height: 50,
                  child: DropdownButton<String>(
                     //style: TextStyle(fontWeight:FontWeight.bold,fontSize: 30,color: Colors.black),
                      value: selectedopt,
                      onChanged: (newvalue){
                        setState(() {
                          selectedopt=newvalue!;
                        });
                      },
                      items: listdata.map((item){
                        return DropdownMenuItem(
                          child: Text(
                            item+"    " ,
                            style: TextStyle(fontWeight:
                            selectedopt==item?FontWeight.bold:FontWeight.normal,
                                fontSize: selectedopt==item?35:20),),
                          value: item,
                        );
                      }).toList()
                  ),
                ),
                InkWell(onTap: (){Navigator.push(context,MaterialPageRoute(builder: (context)=>searchpage()));},
                    child:SizedBox(width:75,child: Icon(Icons.search))),
                PopupMenuButton(itemBuilder:(context)=>
                [
                  PopupMenuItem(child: Text('Log in'),),
                  PopupMenuItem(child: Text('Settings'),
                    onTap:() {Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>settingspage()));},),

                ],
                )
              ],
            ),
            ),
          /*SliverList(delegate: SliverChildBuilderDelegate((BuildContext context,int index){
            return FutureBuilder(future: getpostapi(), builder: (context,snapshot){
              if(!snapshot.hasData){return Text("loading");}
              else{return ListView.builder(itemBuilder: (context,index){
                return Text(snapshot.data![index].body.toString());
              },itemCount: snapshot.data!.length,);}

            },);
          },
          ))*/

            SliverList(
              delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  return FutureBuilder(
                    future: postdata,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Text("Loading");
                      } else if (snapshot.hasError) {
                        return Text("Error: ${snapshot.error}");
                      } else {
                        return ListView.builder(
                          itemBuilder: (context, index) {
                            return Text(snapshot.data![index]['body'].toString());
                          },
                          itemCount: snapshot.data!.length,
                        );
                      }
                    },
                  );
                },
              ),
            ),

            ]




        )
    );}}
    */
