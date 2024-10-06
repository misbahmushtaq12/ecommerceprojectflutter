
import 'package:ecommerceapp/womenstop.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
    class MyCheckboxList extends StatefulWidget {
    @override
    _MyCheckboxListState createState() => _MyCheckboxListState();
    }

    class _MyCheckboxListState extends State<MyCheckboxList> {
    List<String> items = ['adidas', 'adidas Originals', 'Biend', 'Boutique Moschino','Champion','Diesel','jack &jones','Naf Naf','Red Valentino','s.Oliver'];
    List<String> selectedItems = [];

    @override
    Widget build(BuildContext context) {
    return Scaffold(
      body:
      Column(
        children: [
            SizedBox(height: 50,),
            Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                    children: [
                        IconButton(icon:Icon(Icons.arrow_back_ios),onPressed: (){
                          showModalBottomSheet(context: context,
                              builder:(BuildContext context){
                            return Container(height: 100,
                              child: Row(
                              children: [
                                Container(width:180,
                                  child: ElevatedButton(onPressed: (){
                                   setState(() {
                                     Navigator.pop(context);
                                   });
                                    }, child: Text('Discard',style:
                                    TextStyle(color: Colors.black),),)),
                              SizedBox(width:50,),
                              Container(width:180,
                                  child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.red)
                                      ,onPressed: (){
                                        Navigator.push(context,MaterialPageRoute(builder: (context)=>WomenTops()));
                                      }, child: Text('Apply',style: TextStyle(color: Colors.white),)))],
                              ),
                            );});
                        },),
                        SizedBox(width: 120,),
                        Text('Brand',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                    ],
                ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20,top: 25),
              child: Container(height: 45,
                child: TextField(
                    decoration: InputDecoration(
                        fillColor: Colors.grey,
                        filled: true,
                        hintText: 'search',
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(35),
                        borderSide: BorderSide.none),
                        prefixIcon: IconButton(icon:Icon(Icons.search),onPressed: (){
                        },),
                        )
                ),
              ),
            ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left:10,top: 0),
              child: ListView.builder(
                
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                  final item = items[index];

                  return Container(
                    margin: EdgeInsets.zero,
                    child: CheckboxListTile(
                      activeColor: Colors.red,
                    title: Text(item,style: TextStyle(color: selectedItems.contains(item)?Colors.red:Colors.black),),
                    value:selectedItems.contains(item),
                    onChanged: (value) {
                    setState(() {
                    if (value!) {
                    selectedItems.add(item);
                    } else {
                    selectedItems.remove(item);
                    }
                    });
                    },
                    ),
                  );
                  },),
            ),
          ),
        ],
      )
    );
    }
    }

