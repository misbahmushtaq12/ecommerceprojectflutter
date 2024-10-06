import 'package:flutter/material.dart';
import 'package:istproject/searchpage1.dart';
import 'package:istproject/settingspage.dart';

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
  List<String> listdata=[ "Top Stories","Last 24 hours","Last 48hours",
    "Last Week","New Stories", "Best Stories","Ask HN ","Show HN","HN jobs","Bookmarks"];
  String selectedopt="Top Stories";
  List<String> popdata=["Log in","Settings"];
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top:45),
          child:
          //   SingleChildScrollView(
          //   child:
          Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    SizedBox(height: 50,
                      child: DropdownButton<String>(
                          value: null,
                          onChanged: (newvalue){
                            setState(() {
                              selectedopt=newvalue!;
                            });
                          },
                          items: listdata.map((item){
                            return DropdownMenuItem(
                              child: Text(item+"    " ,style: TextStyle(fontWeight:selectedopt==item?FontWeight.bold:FontWeight.normal,fontSize: selectedopt==item?35:20),),
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
                Expanded(
                  child: ListView.builder(
                    //  physics:NeverScrollableScrollPhysics(),
                    // shrinkWrap: true,
                      itemBuilder: (context,index){
                        return ListTile(
                          title:Text('this is your title'),
                          subtitle: Text('this is your title'),
                          trailing: Icon(Icons.message),
                        );
                      }

                  ),
                ) ]
          ),
          // ),
        )
    );


  }
}

