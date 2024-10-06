import 'package:flutter/material.dart';
import 'package:sqlite/databasehandler.dart';
import 'package:sqlite/notes.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DBHelper? dbHelper;
  late Future<List<NotesModel>> notelist;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dbHelper=DBHelper();
    loadData();
  }
  loadData() async{
    notelist=dbHelper!.getNoteList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(

          backgroundColor: Theme.of(context).colorScheme.inversePrimary,

          title: Text('Notes SQL'),
        ),
        body:Column(
          children: [
            Expanded(
              child: FutureBuilder(future:notelist,
                  builder:(context,AsyncSnapshot<List<NotesModel>> snapshot){
                  if (snapshot.hasData){return
                    ListView.builder(itemCount: snapshot.data?.length,
                        itemBuilder: (context,index){
                          return InkWell(
                            onTap: (){
                              dbHelper!.update(
                                  NotesModel(
                                    id: snapshot.data![index].id!,
                                      title:'first flutter node',
                                      age: 11,
                                      description: 'tal tomorrow',
                                      email: 'imy'));
                              setState(() {
                                notelist=dbHelper!.getNoteList();
                              });
                            },
                            child: Dismissible(
                              direction: DismissDirection.endToStart,
                              background: Container(
                                color: Colors.red,
                                child: Icon(Icons.delete_forever),
                              ),
                              onDismissed: (DismissDirection direction){
                                setState(() {
                              dbHelper!.delete(snapshot.data![index].id!);
                              notelist=dbHelper!.getNoteList();
                              snapshot.data!.remove(snapshot.data![index]);
                                });
                              },
                              key: ValueKey<int>(snapshot.data![index].id!),
                              child: Card(
                                  child: ListTile(
                                    contentPadding: EdgeInsets.all(0),
                                    title: Text(snapshot.data![index].title.toString()),
                                    subtitle: Text(snapshot.data![index].description.toString()),
                                    trailing:Text(snapshot.data![index].age.toString()),
                                  )),
                            ),
                          );});
                  }
                  else
                  return Text('loading');}),
            )
          ],
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          dbHelper!.insert(NotesModel(title: 'sirst model',
              age:22,
              description: 'this is my first sql app',
              email:
          'misbah@gmail.com'
          )
          ).then((value) {
            print('data added');
            setState(() {
              notelist=dbHelper!.getNoteList();
            });
          }).onError((error, stackTrace){
            print(error.toString());
          });

        },child: Icon(Icons.add),
      ),


    );
  }
}


