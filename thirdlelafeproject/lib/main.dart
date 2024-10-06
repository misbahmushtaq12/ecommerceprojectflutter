import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:thirdlelafeproject/MyFavouritesetList.dart';
import 'package:thirdlelafeproject/favouritessetstate.dart';
import 'package:thirdlelafeproject/hive.dart';
import 'package:thirdlelafeproject/providers/favourite1provider.dart';
import 'package:thirdlelafeproject/providers/rangeprovider.dart';
//import 'package:provider/provider.dart';
import 'package:thirdlelafeproject/screen/count.dart';
import 'package:thirdlelafeproject/providers/countprovider.dart';
import 'package:thirdlelafeproject/screen/favourite1.dart';
import 'package:thirdlelafeproject/screen/rangeslider.dart';
//import 'package:thirdlelafeproject/providers/favouriteprovider.dart';
//import 'package:thirdlelafeproject/screen/favourites.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Directory document= await getApplicationDocumentsDirectory();
  Hive.init(document.path);
 await   Hive.openBox('students');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return
    ChangeNotifierProvider(create:(context)=>favourite1provider(),
      child:
      MaterialApp(


        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: HiveDemo())
     );
  }
}
