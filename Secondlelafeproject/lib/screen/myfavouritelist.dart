import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:secondlelafeproject/provider/FavouriteProvider.dart';

class MyFavouriteList extends StatefulWidget {  @override
  State<MyFavouriteList> createState() => _MyFavouriteListState();
}

class _MyFavouriteListState extends State<MyFavouriteList> {
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
            child: ListView.builder(itemCount: favouriteprovider.selecteditem.length,
                itemBuilder: (context,index) {
                  return Consumer<FavouriteProvider>(
                      builder: (context, value, child) {
                        return
                          ListTile(
                            onTap: () {
                              if(value.selecteditem.contains(index)){value.removeitem(index);}
                              else
                                value.additem(index);
                            },
                            title: Text('Item' + (index + 1).toString()),
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
