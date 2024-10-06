import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:secondlelafeproject/provider/RangeProvider.dart';
import 'package:secondlelafeproject/provider/Countprovider.dart';
import 'package:secondlelafeproject/screen/Favourites.dart';
import 'package:secondlelafeproject/provider/FavouriteProvider.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (context)=>CountProvider()),
      ChangeNotifierProvider(create: (context)=>RangeProvider()),
      ChangeNotifierProvider(create: (context)=>FavouriteProvider())],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home:  FavouriteScreen(),
      ),
    );
  }
}

/*class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body:Text('hi')
    );
  }
}*/
