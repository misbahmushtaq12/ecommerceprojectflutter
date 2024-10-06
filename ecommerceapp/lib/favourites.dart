import 'dart:convert';
import 'package:ecommerceapp/BagProvider.dart';
import 'package:ecommerceapp/favouriteprovider.dart';
import 'package:ecommerceapp/filter.dart';
import 'package:http/http.dart' as http;
import 'package:ecommerceapp/modules/PostModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Favourites extends StatefulWidget{
  @override
  State <Favourites> createState()=>_FavouritesState();
}
class _FavouritesState extends State<Favourites>
{var selectedstring='';
  List<PostModel>Postlist=[];
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
    final bagprovider =Provider.of<BagProvider>(context,listen: false);
   return Scaffold(
     body: Column(crossAxisAlignment: CrossAxisAlignment.start,
       children: [
         SizedBox(height: 40),
         TextField(
           decoration: InputDecoration(
               hintText: 'Favourites',
             hintStyle: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),
               border: InputBorder.none,
               suffixIcon: IconButton(icon:Icon(Icons.search),onPressed: (){
               },),
           ),textAlign: TextAlign.center,
         ),
         SingleChildScrollView( scrollDirection: Axis.horizontal,
           child: Row(
             children: [
               Container(width: 145,
                   child: Padding(
                     padding: const EdgeInsets.only(left: 15,top:0),
                     child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.black54),
                         onPressed: (){}, child:Text('Summer',style: TextStyle(color: Colors.white),)),
                   )),
               Container(width: 145,
                   child: Padding(
                     padding: const EdgeInsets.only(left: 15),
                     child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.black54),
                         onPressed: (){}, child:Text('T-Shirts',style: TextStyle(color: Colors.white),)),
                   )),
               Container(width: 145,
                   child: Padding(
                     padding: const EdgeInsets.only(left: 15),
                     child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.black54),
                         onPressed: (){}, child:Text('Shirts',style: TextStyle(color: Colors.white),)),
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
                           selectedstring='Popular';
                         });
                       },
                     ),
                     ListTile(
                       title: Text('Newest'),
                       onTap: (){
                         setState(() {
                           selectedstring='Newest';
                         });
                       },
                     ),
                     ListTile(
                       title: Text('Customer review'),
                       onTap: (){
                         setState(() {
                           selectedstring='Customer review';
                         });
                       },
                     ),
                     ListTile(
                       title: Text('Price:Lowest to high'),
                       onTap: (){
                         setState(() {
                           selectedstring='Price:Lowest to high';
                         });
                       },
                     ),
                     ListTile(
                       title: Text('Price:highest to low'),
                       onTap: (){
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
         FutureBuilder(future: getpostapi(),
             builder:(context,snapshot) {
               if (!snapshot.hasData) {
                 return Text('loading');
               }
               else {
                 return Consumer<FavouriteProvider>(
                     builder: (context, value, child) {
                       return
                         Expanded(
                           child: ListView.builder(
                             itemBuilder: (context, index) {
                               final int postIndex = favouriteprovider.selecteditem[index];
                               return Padding(
                                 padding: const EdgeInsets.all(15),
                                 child: Stack(
                                   children: [
                                     Row(
                                       crossAxisAlignment: CrossAxisAlignment.start,
                                       children: [

                                         Image.network(
                                           Postlist[postIndex].image.toString(), height: 150,
                                           width: 150,
                                           fit: BoxFit.cover,),
                                         SizedBox(width: 30),
                                         Container(height:195,
                                           child: Column(
                                             children:[
                                               Row(mainAxisAlignment: MainAxisAlignment.start,
                                                 children:[
                                           Container(width: 150,
                                               child:
                                               Text(Postlist[postIndex].title.toString(),
                                                 style: TextStyle(
                                                     fontWeight: FontWeight.bold),)),
                                           IconButton(onPressed: (){
                                             favouriteprovider.removeitem(postIndex);
                                           },
                                               icon:Icon(Icons.clear)
                                           ),]),
                                           Row(
                                             children: [
                                               Text('${Postlist[postIndex].price.toString()}\$',
                                                 style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),),
                                               SizedBox(width: 50,),
                                               Text('Ratings:${Postlist[postIndex].rating!.rate
                                                   .toString()}'),
                                             ],
                                           ),
                                           ]),
                                         ),
                                       ],
                                     ),
                                     Positioned(
                                       bottom:15,right: 0,
                                       child: Consumer<BagProvider>(builder:(context,value,child){ return
                                         Container(height: 50,width:50,
                                           decoration: BoxDecoration(
                                               color: Colors.red,
                                               borderRadius: BorderRadius.circular(25)),
                                           child: IconButton(onPressed: (){
                                             final message=SnackBar(
                                                 backgroundColor: Colors.red,
                                                 duration: Duration(microseconds:3),
                                                 content: Text('Added to Cart',textAlign: TextAlign.center,));
                                             ScaffoldMessenger.of(context).showSnackBar(message);
                                             if(!value.CartSelected.contains(postIndex))
                                             {value.additem1(postIndex);}
                                               favouriteprovider.removeitem(postIndex);
                                           },
                                               icon:Icon(Icons.shopping_bag,color: Colors.white,)),
                                         );
                                       }),
                                     ),
                                   ],
                                 ),
                               );
                             }, itemCount:favouriteprovider.selecteditem.length,),
                         );
                     });
               }
             }),
       ],
     ),
   );
  }

}