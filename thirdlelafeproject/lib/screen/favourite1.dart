import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thirdlelafeproject/screen/myfav1list.dart';

import '../providers/favourite1provider.dart';

class favourite1 extends StatefulWidget {  @override
  State<favourite1> createState() => _favourite1State();
}

class _favourite1State extends State<favourite1> {
  @override
  Widget build(BuildContext context) {
    final favouriteprovider =Provider.of<favourite1provider>(context,listen: false);
  return Scaffold(
    appBar: AppBar(
      actions: [
        InkWell(onTap:(){Navigator.push(context,MaterialPageRoute(builder: (context)=>MyFavourite1List()));}
            , child: Icon(Icons.favorite)),
        SizedBox(width: 20,)
      ],
    ),
    body:
    Column(
      children: [
        Expanded(
          child: Consumer<favourite1provider>(builder: (context,value,child){
        return
        ListView.builder(itemCount:100,
            itemBuilder:(context,index)
            {
            return ListTile(
              onTap: (){
                if(value.ispressed.contains(index)){
                 value.ispressed.remove(index);
                  setState(() {

                  });
                }
                else
                  value.ispressed.add(index);
                setState(() {

                });},
              title:Text('item '+ '$index'),
              trailing:
              Icon( value.ispressed.contains(index)?Icons.favorite:Icons.favorite_border_outlined),

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

