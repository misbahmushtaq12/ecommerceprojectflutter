import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/favourite1provider.dart';

class MyFavourite1List extends StatefulWidget {  @override
  State<MyFavourite1List> createState() => _MyFavourite1ListState();
}

class _MyFavourite1ListState extends State<MyFavourite1List> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Column(
        children: [
          Expanded(
              child: Consumer<favourite1provider>(builder: (context,value,child){
                return
                  ListView.builder(itemCount: value.ispressed.length,
                    itemBuilder:(context,index)
                    { final int newindex=value.ispressed[index];
                      return ListTile(
                        title:Text('item '+ '$newindex'),
                        trailing:
                        Icon( value.ispressed.contains(newindex)?Icons.favorite:Icons.favorite_border_outlined),

                      );
                    },
                  );
              }
              )
          )
        ],
      ),
    );
  }}
