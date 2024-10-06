import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:secondlelafeproject/provider/FavouriteProvider.dart';
import 'package:secondlelafeproject/screen/myfavouritelist.dart';

class FavouriteScreen extends StatefulWidget {  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
   @override
  Widget build(BuildContext context) {
     final favouriteprovider =Provider.of<FavouriteProvider>(context);
     return Scaffold(
       appBar: AppBar(
         actions: [
           InkWell(onTap:(){Navigator.push(context,MaterialPageRoute(builder: (context)=>MyFavouriteList()));}
              , child: Icon(Icons.favorite)),
           SizedBox(width: 20,)
         ],
       ),
       body: Column(
         children: [
           Expanded(
             child: ListView.builder(itemCount: 100,
                 itemBuilder: (context,index) {
                   return Consumer<FavouriteProvider>(
                       builder: (context, value, child) {
                         return
                           ListTile(
                             onTap: () {
                               if(value.selecteditem.contains(index)){value.removeitem(index);}
                               else
                               favouriteprovider.additem(index);
                             },
                             title: Text('Item' + (index+1).toString()),
                             trailing: Icon(
                                 value.selecteditem.contains(index) ? Icons
                                     .favorite : Icons
                                     .favorite_border_outlined),
                           );
                       });
                 }))
         ],
       ),
     );

  }}
