import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'favouritedlist.dart';
import 'modules/PosModel.dart';

void main()
async{
  WidgetsFlutterBinding.ensureInitialized();
  Directory document=await getApplicationDocumentsDirectory();
  Hive.init(document.path);
  await Hive.openBox('students');
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return
      MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
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
  List<PostModel>Postlist=[];
  Future<List<PostModel>>getpostapi()
  async{
    final response=await http.get(Uri.parse('https://fakestoreapi.com/products'));
    var data=jsonDecode(response.body.toString());
    if(response.statusCode==200)
    {
      for (Map i in data){
        Postlist.add(PostModel.fromJson(i));
      }return Postlist;
    }else{
      return Postlist;
    }
  }
Box ? studentBox;
  @override
  void initState(){
    super.initState();
    studentBox=Hive.box('students');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FavouritedList()),
              );
            },
          ),
        ],
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body:  Container(width: 370,
        child: FutureBuilder(future: getpostapi(),
            builder:(context,snapshot){
              if(!snapshot.hasData){return Text('Loading');}
              else{
                return
                  ListView.builder(

                    itemBuilder: (context,index)
                    {
                      return Padding(
                        key: ValueKey(Postlist[index].id),
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            IconButton(onPressed: (){
                              return
                                setState(() {
                                if (studentBox!.containsKey(
                                    Postlist[index].id))
                                {
                                  studentBox?.deleteAt(index);
                                }
                                else {
                                  studentBox?.put(
                                      Postlist[index].id,
                                      index);
                                }
                              });
                            }, icon:studentBox!.containsKey(Postlist[index].id) ?Icon(Icons.favorite) : Icon(Icons.favorite_border_outlined)),
                            Image.network(Postlist[index].image.toString(),height: 300,width: 200,fit: BoxFit.cover,),
                            SizedBox(height: 10,),

                            Container(width:200,
                                child:
                                Text(Postlist[index].title.toString(),
                                  style:TextStyle(fontWeight: FontWeight.bold),)),
                            Text('Category:${Postlist[index].category.toString()},'),
                          ],
                        ),
                      );
                    },itemCount: Postlist.length,);
              }
            }
        ),
      )
      );// This trailing comma makes au
  }
}
