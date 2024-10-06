import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyFavouritesetList extends StatefulWidget {
  final List<int>selectedItem;
  MyFavouritesetList({required this.selectedItem});
  @override
State<MyFavouritesetList> createState() => _MyFavouritesetState();
}

class _MyFavouritesetState extends State<MyFavouritesetList> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
      ),

      body: Column(
        children: [
          Expanded(
            child: ListView.builder(itemCount: widget.selectedItem.length,
              itemBuilder:(context,index)
              { final int newindex=widget.selectedItem[index];
                return ListTile(
                  title:Text('item '+ '$newindex'),
                  trailing:
                  Icon( widget.selectedItem.contains(newindex)?Icons.favorite:Icons.favorite_border_outlined),
                );
              },
            ),
          )
        ],
      ),
    );
  }}
