import 'dart:convert';
import 'package:ecommerceapp/checkout.dart';
import 'package:ecommerceapp/favouriteprovider.dart';
import 'package:ecommerceapp/sametextstyle.dart';
import 'package:http/http.dart' as http;
import 'package:ecommerceapp/BagProvider.dart';
import 'package:ecommerceapp/modules/PostModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Bag extends StatefulWidget {  @override
  State<Bag> createState() => _BagState();
}

class _BagState extends State<Bag> {
  List<PostModel>Postlist=[];
  List<int> counterList = [];
  Future<List<PostModel>>getpostapi()
  async{
    final response=await http.get(Uri.parse('https://fakestoreapi.com/products'));
    var data=jsonDecode(response.body.toString());
    if(response.statusCode==200)
    {
      for (Map i in data){
        Postlist.add(PostModel.fromJson(i));
        counterList.add(1);
      }return Postlist;
    }else{
      return Postlist;
    }
  }
  @override
  Widget build(BuildContext context) {
    final bagprovider =Provider.of<BagProvider>(context,listen: false);
  return Scaffold(
    body:
    SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 40),
          TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              suffixIcon: IconButton(icon:Icon(Icons.search),onPressed: (){
              },),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('My Bag',style: SameTextStyle.heading,),
          ),
          FutureBuilder(future: getpostapi(),
              builder:(context,snapshot) {
                if (!snapshot.hasData) {
                  return Text('loading');
                }
                else {
                  return Consumer<BagProvider>(
                      builder: (context, value, child) {
                        return
                          SingleChildScrollView(
                            child: Column(
                              children: [
                                ListView.builder(shrinkWrap:true,physics: NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    final int postIndex = bagprovider.CartSelected[index];
                                     int counter=counterList[postIndex];
                                    return Padding(
                                      padding: const EdgeInsets.all(15),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
      
                                          Image.network(
                                            Postlist[postIndex].image.toString(), height: 100,
                                            width: 150,
                                            fit: BoxFit.cover,),
                                          SizedBox(width: 30),
                                          Column(
                                              children:[
                                                Row(crossAxisAlignment: CrossAxisAlignment.start,
                                                    children:[
                                                      Container(width: 150,
                                                          child:
                                                          Text(Postlist[postIndex].title.toString(),
                                                            style: TextStyle(
                                                                fontWeight: FontWeight.bold),)),
                                                      Consumer<FavouriteProvider>(builder:(context,value,child){ return
                                                        PopupMenuButton(
                                                          itemBuilder: (context)=>
                                                          [
                                                            PopupMenuItem(onTap: (){
                                                               if(!value.selecteditem.contains(postIndex))
                                                                   {value.additem(postIndex);}
      
                                                          },
                                                              value: 'add to favourites',
                                                              child: Text('Add to favourites')),
                                                          PopupMenuItem(onTap: (){
                                                            bagprovider.removeitem1(postIndex);
                                                          },
                                                              value: 'delete from list',
                                                              child: Text('Delete from the list'))],
                                                       offset: Offset(0,-130), );})
      
      
                                                    ]
                                                ),
                                                Row(mainAxisAlignment: MainAxisAlignment.start,
                                                  children: [
                                    Container(height: 50,width:50,
                                    decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(25)),
                                    child: IconButton(onPressed: (){
                                      setState(() {
                                        if(counter>1)
                                        counter--;
                                        counterList[postIndex]=counter;
                                      });
                                    },
                                    icon:Icon(Icons.minimize_sharp)),
                                    ),
                                                    Text('$counter'),
                                                    Container(height: 50,width:50,
                                                      decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius: BorderRadius.circular(25)),
                                                      child: IconButton(onPressed: (){
                                                        setState(() {
                                                          counter++;
                                                          counterList[postIndex]=counter;
                                                        });
                                                      },
      
                                                          icon:Icon(Icons.add)),
                                                    ),
                                                    SizedBox(width: 20,),
                                                    Text('${Postlist[postIndex].price.toString()}\$',
                                                      style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),),
      
                                                  ],
                                                ),
                                              ]),
                                        ],
                                      ),
                                    );
                                  }, itemCount:bagprovider.CartSelected.length,),
                                Visibility(visible: bagprovider.CartSelected.isNotEmpty,
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(10),
                                            child: Container(height: 40,width: 380,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.circular(25),  // Add color if you want a border color
                                              ),

                                              child: TextField(

                                                onTap: (){showModalBottomSheet(
                                                    context: context,
                                                    builder: (BuildContext context){
                                                      return Container(height:450,width: 400,
                                                        child: Padding(
                                                          padding: const EdgeInsets.only(left: 25),
                                                          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: [
                                                              SizedBox(height: 50,),
                                                              Container(height: 40,width: 360,
                                                                decoration: BoxDecoration(
                                                                  color: Colors.white,
                                                                  borderRadius: BorderRadius.circular(25),  // Add color if you want a border color
                                                                ),

                                                                child: TextField(
                                                                  decoration: InputDecoration(
                                                                      contentPadding: EdgeInsets.all(10),
                                                                      hintText: 'Enter Your promo code',
                                                                      hintStyle: TextStyle(color: Colors.grey),
                                                                      border: OutlineInputBorder(
                                                                        borderSide: BorderSide.none,

                                                                      ),
                                                                      suffixIcon: Container(height: 50,width: 40,
                                                                          decoration: BoxDecoration(
                                                                              color: Colors.black,
                                                                              borderRadius: BorderRadius.circular(25)
                                                                          ),
                                                                          child: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward,color: Colors.white,)))
                                                                  ),
                                                                ),
                                                              ),
                                                              SizedBox(height: 30,),
                                                              Text('Your Promo Codes',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                                                              SizedBox(height: 10,),
                                                              Row(
                                                                children: [
                                                                  Container(height: 80,width: 80,
                                                                    color: Colors.red,
                                                                    child: Text('10 % off',textAlign:TextAlign.center,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 27),),
                                                                  ),
                                                                  SizedBox(width: 15,),
                                                                  Column(
                                                                    children: [
                                                                      Text('Personal offer',style: TextStyle(fontWeight: FontWeight.bold),),
                                                                      Text('mypromocode2020')
                                                                    ],
                                                                  ),
                                                                  SizedBox(width: 15,),
                                                                  ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                                                                      onPressed: (){}, child: Text('Apply',style: TextStyle(color: Colors.white),))
                                                                ],
                                                              ),
                                                              SizedBox(height: 10,),
                                                              Row(
                                                                children: [
                                                                  Stack(
                                                                    children: [
                                                                      Image.asset('assets/images/image.png'),
                                                                      Positioned(top: 0,bottom: 0,left: 0,right: 0,
                                                                          child: Text("15 % off",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 27),))
                                                                    ],
                                                                  ),
                                                                  SizedBox(width: 15,),
                                                                  Column(
                                                                    children: [
                                                                      Text('Personal offer',style: TextStyle(fontWeight: FontWeight.bold),),
                                                                      Text('mypromocode2020')
                                                                    ],
                                                                  ),
                                                                  SizedBox(width: 15,),
                                                                  ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                                                                      onPressed: (){}, child: Text('Apply',style: TextStyle(color: Colors.white),))
                                                                ],
                                                              ),
                                                              SizedBox(height: 10,),
                                                              Row(
                                                                children: [
                                                                  Container(height: 80,width: 80,
                                                                    color: Colors.black,
                                                                    child: Text('22 % off',textAlign:TextAlign.center,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 27),),
                                                                  ),
                                                                  SizedBox(width: 15,),
                                                                  Column(
                                                                    children: [
                                                                      Text('Personal offer',style: TextStyle(fontWeight: FontWeight.bold),),
                                                                      Text('mypromocode2020')
                                                                    ],
                                                                  ),
                                                                  SizedBox(width: 15,),
                                                                  ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                                                                      onPressed: (){}, child: Text('Apply',style: TextStyle(color: Colors.white),))
                                                                ],
                                                              ),



                                                            ],
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                );},
                                                decoration: InputDecoration(
                                                    contentPadding: EdgeInsets.all(10),
                                                    hintText: 'Enter Your promo code',
                                                    hintStyle: TextStyle(color: Colors.grey),
                                                    border: OutlineInputBorder(
                                                      borderSide: BorderSide.none,

                                                    ),
                                                    suffixIcon:  Container(height: 50,width: 50,
                                                        decoration: BoxDecoration(
                                                            color: Colors.black,
                                                            borderRadius: BorderRadius.circular(25)
                                                        ),
                                                        child: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward,color: Colors.white,)))
                                                ),

                                              ),
                                            ),
                                          ),

                                        ],
                                      ),
                                        SizedBox(height: 40,),
                                        Container(width: 370,height: 45,

                                            child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                                                onPressed: (){
                                              Navigator.pushReplacement(context, MaterialPageRoute(builder: ((context)=>Checkout())));
                                                }, child: Text('Checkout',style: TextStyle(color: Colors.white),)))
                                    ],
                                  ),
                                ),

      
                                
      
                              ],
                            ),

                          );
      
                      });
                }
              }),
      
      
        ],
      ),
    ),
  );
  }}
