import 'dart:convert';
import 'package:ecommerceapp/ProductDetails.dart';
import 'package:ecommerceapp/favouriteprovider.dart';
import 'package:ecommerceapp/filter.dart';
import 'package:ecommerceapp/sametextstyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'modules/PostModel.dart';

class WomenTops extends StatefulWidget{
  @override
  State<WomenTops> createState() => _WomenTopsState();
}

class _WomenTopsState extends State<WomenTops> {
  var selectedstring='';
  List<PostModel>Postlist=[];
  bool buttonpressed=false;
  Future<List<PostModel>>getpostapi()
  async{
  final response=await http.get(Uri.parse('https://fakestoreapi.com/products'));
  var data=jsonDecode(response.body.toString());
  if(response.statusCode==200)
  {
  for (Map i in data){
  Postlist.add(PostModel.fromJson(i));
  }return Postlist;
  }else{
  return Postlist;
  }
}
  @override
  Widget build(BuildContext context) {
    final favouriteprovider =Provider.of<FavouriteProvider>(context,listen: false);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20 ),
              TextField(
                decoration: InputDecoration(
                    hintText: 'Categories',
                    border: InputBorder.none,
                    suffixIcon: IconButton(icon:Icon(Icons.search),onPressed: (){
                    },),
                    prefixIcon: IconButton(icon:Icon(Icons.arrow_back_ios),onPressed: (){
                    },
                    )
                ),textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10,left: 8,bottom: 7),
                child: Text("Women's tops",style: SameTextStyle.heading,),
              ),
              SingleChildScrollView( scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(width: 145,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15,top:0),
                          child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.black54),
                              onPressed: (){}, child:Text('T-shirts',style: TextStyle(color: Colors.white),)),
                        )),
                    Container(width: 145,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.black54),
                              onPressed: (){}, child:Text('crop tops',style: TextStyle(color: Colors.white),)),
                        )),
                    Container(width: 145,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.black54),
                              onPressed: (){}, child:Text('Sleeveless',style: TextStyle(color: Colors.white),)),
                        )),
                    Container(width: 145,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.black54),
                              onPressed: (){}, child:Text('Blouses',style: TextStyle(color: Colors.white),)),
                        )),
          
                  ],
                ),
              ),
              Row(
                children: [
                  IconButton(onPressed: (){
                    Navigator.push(context,MaterialPageRoute(builder: (context)=>Filter()));
                  }, icon:Icon(Icons.filter_list)),
                  Text('Filters',style: TextStyle(color: Colors.black54),),
          
                  SizedBox(width: 70,),
                  Container(width:200,child: Text('$selectedstring')),
                  IconButton(onPressed: ()
                  {showModalBottomSheet(
                      context: context, builder:(BuildContext context){
          
                    return Container(height: 350,
                      child: Column(
                        children: [
                          Text('Sort by',style:TextStyle(fontWeight:FontWeight.bold,fontSize:25),textAlign: TextAlign.center,),
                          ListTile(
                            title: Text('Popular'),
                            onTap: (){
                              setState(() {
                                Navigator.pop(context);
                              selectedstring='Popular';
                              });
                            },
                          ),
                          ListTile(
                            title: Text('Newest'),
                            onTap: (){
                              setState(() {
                                Navigator.pop(context);
                                selectedstring='Newest';
                              });
                            },
                          ),
                          ListTile(
                            title: Text('Customer review'),
                            onTap: (){
                              setState(() {
                                Navigator.pop(context);
                                selectedstring='Customer review';
                              });
                            },
                          ),
                          ListTile(
                            title: Text('Price:Lowest to high'),
                            onTap: (){
                              setState(() {
                                Navigator.pop(context);
                                selectedstring='Price:Lowest to high';
                              });
                            },
                          ),
                          ListTile(
                            title: Text('Price:highest to low'),
                            onTap: (){
                              Navigator.pop(context);
                              setState(() {
                                selectedstring='Price:highest to low';
                              });
                            },
          
                          ),
          
                        ],
                      ),
                    );
                  }
                  );
                  }, icon:Icon(Icons.menu)
                  )
          
                ],
              ),
            SingleChildScrollView(
              child: FutureBuilder(future: getpostapi(),
                  builder:(context,snapshot){
                  if(!snapshot.hasData){
                    return Shimmer.fromColors(
                    child: GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          title: Container(
                            color: Colors.white,
                            height: 10,
                            width: 100,
                          ),
                          subtitle: Container(
                            color: Colors.white,
                            height: 10,
                            width: 100,
                          ),
                          leading: CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.white,
                          ),
                        );
                      },
                      itemCount: 30,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                    ),
                    enabled: true,
                    //  gradient: gradient,
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                  );}
                  else{
                  return GridView.builder(itemCount:Postlist.length,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisExtent: 480),
                      itemBuilder: (context,index){
                    return InkWell(
                      onTap:(){ Navigator.push(context,MaterialPageRoute(builder:(context)=>ProductDetails(Product: Postlist[index],Index:index ,)));},
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Stack(
                                      children:[
                                    Image.network(Postlist[index].image.toString(),),
                                    Positioned(
                                    bottom:-10,right: 0,
                                      child: Consumer<FavouriteProvider>(builder:(context,value,child){ return
                                        Container(height: 50,width:50,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                      borderRadius: BorderRadius.circular(25)),
                                          child: IconButton(onPressed: (){
                                            if(value.selecteditem.contains(index))
                                            {value.removeitem(index);}
                                            else
                                              value.additem(index);
                                          },
                                              icon:value.selecteditem.contains(index)?Icon(Icons.favorite): Icon(Icons.favorite_border_outlined)),
                                        );
                                      }),
                                    ),
                                     ]),
                                    Container(//width:200,
                                        child:
                                    Text(Postlist[index].title.toString(),
                                      style:TextStyle(fontWeight: FontWeight.bold),)),
                                    Text('Category:${Postlist[index].category.toString()},'),
                                    Text('\$:${Postlist[index].price.toString()}',style: TextStyle(color:Colors.red),),
                                  ],
                        ),
                      ),
                    );
                  }
                  );
                }
                }),
            )
            ],
          ),
        ),
      )
    );
  }
}