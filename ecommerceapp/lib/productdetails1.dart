import 'dart:convert';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:ecommerceapp/BagProvider.dart';
import 'package:ecommerceapp/support.dart';
import 'package:http/http.dart' as http;
import 'package:ecommerceapp/ShippingInfo.dart';
import 'package:ecommerceapp/modules/PostModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'favouriteprovider.dart';
import 'modules/NewModel.dart';

class ProductDetails1 extends StatefulWidget {
  final NewModel Product;
  final int Index;
  ProductDetails1({required this.Product,required this.Index});
  @override
  State<ProductDetails1> createState() => _ProductDetailsState1();
}

class _ProductDetailsState1 extends State<ProductDetails1> {
  List<String> Dropdown1=['XS','S','M','L','XL'];
  var defaultValue = "Size";
  var defaultvalue2 = "Color";
  List<String> Dropdown2=['Black','Blue','Grey','White','Pink','Beige','Red','Brown','Yellow'];
  List<PostModel>postmodellist=[];
  Future<List<PostModel>>getpostmodel()
  async{
    final response=await http.get(Uri.parse('https://fakestoreapi.com/products'));
    var data=jsonDecode(response.body.toString());
    if(response.statusCode==200)
    {
      for (Map i in data){
        postmodellist.add(PostModel.fromJson(i));
      }return postmodellist;
    }else{
      return postmodellist;
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 50),
              Row(
                children: [
                  IconButton(icon:Icon(Icons.arrow_back_ios),onPressed: (){}),
                  SizedBox(width: 70,),
                  Text("Women's Top",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                  SizedBox(width: 75,),
                  IconButton(onPressed: (){}, icon:Icon(Icons.share)),],),


              Image.network(widget.Product.images.toString(),height: 250,width: 200,fit: BoxFit.cover,),
              Padding(
                padding: const EdgeInsets.all(25),
                child: Row(children: [
                  Container(width:120,height: 59,
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton2(
                        alignment: Alignment.center,
                        hint: Text(
                          "$defaultValue",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            defaultValue = newValue!;
                          });
                        },
                        items: Dropdown1.map<DropdownMenuItem<String>>(
                                (String itemValue) {
                              return DropdownMenuItem(
                                value: itemValue,
                                child: Text(
                                  itemValue,
                                  style: TextStyle(
                                      fontSize: 15, fontWeight: FontWeight.bold),
                                ),
                              );
                            }).toList(),
                      ),
                    ),
                  ),
                  SizedBox(width: 30,),
                  Container(width:120,height: 59,
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton2(
                        alignment: Alignment.center,
                        hint: Text(
                          "$defaultvalue2",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            defaultvalue2 = newValue!;
                          });
                        },
                        items: Dropdown2.map<DropdownMenuItem<String>>(
                                (String itemValue) {
                              return DropdownMenuItem(
                                value: itemValue,
                                child: Text(
                                  itemValue,
                                  style: TextStyle(
                                      fontSize: 15, fontWeight: FontWeight.bold),
                                ),
                              );
                            }).toList(),
                      ),
                    ),
                  ),
                  Consumer<FavouriteProvider>(builder:(context,value,child){ return
                    Container(height: 50,width:50,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25)),
                      child: IconButton(onPressed: (){
                        if(value.selecteditem.contains(widget.Index))
                        {value.removeitem(widget.Index);}
                        else
                          value.additem(widget.Index);
                      },
                          icon:value.selecteditem.contains(widget.Index)?Icon(Icons.favorite): Icon(Icons.favorite_border_outlined)),
                    );
                  }),
                ],
                ),
              ) ,
              Text(widget.Product.title.toString(),style:TextStyle(fontSize:25,fontWeight: FontWeight.bold)),
              SizedBox(height: 20,),
              Row(mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Category:${widget.Product.category.toString()},'),
                  SizedBox(width: 80,),
                  Text('\$:${widget.Product.price.toString()}',style: TextStyle(color:Colors.black,fontSize:25,fontWeight: FontWeight.bold)),
                ],
              ),
              SizedBox(height: 20,),
              Consumer<BagProvider>(builder:(context,value,child){
                return
                  Container(height: 50,width: 380,
                    child:
                    ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.red,),
                        onPressed: (){
                          final message=SnackBar(
                              backgroundColor: Colors.red,
                              duration: Duration(seconds: 3),
                              content: Text('Added to Cart',textAlign: TextAlign.center,));
                          ScaffoldMessenger.of(context).showSnackBar(message);
                          if(!value.CartSelected.contains(widget.Index))

                          { value.additem1(widget.Index);};

                        }, child: Text('ADD TO CART',style: TextStyle(color: Colors.white))),
                  );}),
              SizedBox(height: 20,),
              ListTile(
                  onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>ShippingInfo()));},
                  title: Text('Shipping Info',),
                  trailing: IconButton(icon: Icon(Icons.arrow_forward_ios),onPressed:() {Navigator.push(context, MaterialPageRoute(builder: (context)=>ShippingInfo()));}
                  )
              ),
              ListTile(
                  onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>ShippingInfo()));},
                  title: Text('Support',),
                  trailing: IconButton(icon: Icon(Icons.arrow_forward_ios),onPressed:() {Navigator.push(context, MaterialPageRoute(builder: (context)=>Support()));}
                  )
              ),
              SizedBox(height: 20,),
              Text('You can also like this',textAlign: TextAlign.start,style: TextStyle(fontWeight: FontWeight.bold),),
              Container(height: 370,
                child:  FutureBuilder(future: getpostmodel(),
                    builder:(context,snapshot){
                      if(!snapshot.hasData){return Text('loading');}
                      else{
                        return
                          ListView.builder(scrollDirection: Axis.horizontal,
                            itemBuilder: (context,index)
                            {if (postmodellist[index].image != null &&
                                postmodellist[index].image!.length > 1)
                              return Padding(
                                padding: const EdgeInsets.all(15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.network(postmodellist[index].image![1].toString(),height: 250,width: 200,fit: BoxFit.cover,),
                                    Container(width:200,
                                        child: Text(postmodellist[index].title.toString(),style:TextStyle(fontWeight: FontWeight.bold),)),
                                    Text('\$:${postmodellist[index].price.toString()}',style: TextStyle(color:Colors.red),),
                                  ],
                                ),
                              );
                            }
                            ,itemCount: postmodellist.length,);
                      }
                    }
                ),)
            ],
          ),
        ),
      ),
    );
  }}
