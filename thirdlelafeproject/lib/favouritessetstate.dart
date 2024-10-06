import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thirdlelafeproject/MyFavouritesetList.dart';

class  FavouriteSet extends StatefulWidget {  @override
  State<FavouriteSet> createState() => _FavouriteSetState();
}

class _FavouriteSetState extends State<FavouriteSet> {
  List<int> selecteditem=[];
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(onTap:(){Navigator.push(context,MaterialPageRoute(builder: (context)=>MyFavouritesetList( selectedItem:selecteditem,)));}
              , child: Icon(Icons.favorite)),
          SizedBox(width: 20,)
        ],
      ),

      body: Column(
        children: [
          Expanded(
            child: ListView.builder(itemCount: 100,
              itemBuilder:(context,index)
              {
                return ListTile(
                  onTap: (){
                    if(selecteditem.contains(index)){
                      selecteditem.remove(index);
                      setState(() {

                      });
                    }
                    else
                    selecteditem.add(index);
                    setState(() {

                    });},
                  title:Text('item '+ '$index'),
                  trailing:
                  Icon( selecteditem.contains(index)?Icons.favorite:Icons.favorite_border_outlined),

                );
              },
            ),
          )
        ],
      ),
    );
  }}
