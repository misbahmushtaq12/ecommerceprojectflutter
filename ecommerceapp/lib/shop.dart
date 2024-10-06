import 'package:ecommerceapp/womenstop.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Shop extends StatefulWidget {  @override
  State<Shop> createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  bool isvisible=false;
  var arrname=['Tops','Shirts & Blouses','knitwear','Blazers','Outerwear','Pants','jeans','shorts','Skirts','Dresses'];
  @override
  Widget build(BuildContext context) {
 return DefaultTabController(length: 3,
     child: Scaffold(
       body: Column(
         children: [
           SizedBox(height:45),
           TextField(
             decoration: InputDecoration(
                 hintText: 'Categories',
                 border: InputBorder.none,
                 suffixIcon: IconButton(icon:Icon(Icons.search),onPressed: (){
                   setState(() {
                     isvisible=true;
                   });
                 },),
                 prefixIcon: IconButton(icon:Icon(Icons.arrow_back_ios),onPressed: (){
                   setState(() {
                     isvisible=false;
                   });
                 },
                 )
             ),textAlign: TextAlign.center,
           ),
           SizedBox(height: 25,),
           Visibility(visible: !isvisible,
             child: TabBar(indicatorColor:Colors.red,
                 labelColor:Colors.black,
                 unselectedLabelColor:Colors.black,
                 tabs:[
               Tab(text:'Women',),
               Tab(text:'Men'),
               Tab(text:'Kids')
             ]
             ),
           ),
           Visibility(visible: !isvisible,
             child: Expanded(
               child: TabBarView(children: [
               Column(crossAxisAlignment: CrossAxisAlignment.start,mainAxisSize: MainAxisSize.min,
                 children: [
                   Padding(
                     padding: const EdgeInsets.all(25),
                     child: Container(height:80,width:400,
                         decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.red),
                         child: Column(
                           children: [
                             Padding(
                               padding: const EdgeInsets.only(top: 15),
                               child: Center(child: Text('SUMMER SALES',style: TextStyle(fontWeight:FontWeight.w800,fontSize:20,
                                   color: Colors.white),)),
                             ),
                             Center(child: Text('Up to 50% off',style:TextStyle(color: Colors.white))),
                           ],
                         )),
                   ),
                   Padding(
                     padding: const EdgeInsets.only(left: 15,right: 15,bottom: 15),
                     child: Row(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Container(child: Padding(
                           padding: const EdgeInsets.only(left: 25,top: 30),
                           child: Text('New',style:TextStyle(fontWeight: FontWeight.bold)),
                         ),
                           height: 85,width: 190,),
                         Image.asset('assets/images/new.png'),
                       ],
                     ),
                   ),
                   SizedBox(height: 2),
                   Padding(
                     padding: const EdgeInsets.only(left:40),
                     child: Row(
                       children: [
                         Container(child: Padding(
                           padding: const EdgeInsets.only(top: 30),
                           child: Text('Clothes',style:TextStyle(fontWeight: FontWeight.bold)),
                         ),
                           height: 100,width: 150,),
                         Container(height:100,
                             width:200,child: Image.asset('assets/images/clothes.png')),
                       ],
                     ),
                   ),
                   SizedBox(height: 15,),
                   Padding(
                     padding: const EdgeInsets.only(left: 40),
                     child: Row(
                       children: [
                         Container(child: Padding(
                           padding: const EdgeInsets.only(top: 30),
                           child: Text('Shoes',style:TextStyle(fontWeight: FontWeight.bold)),
                         ),
                           height: 100,width: 165,),
                         Image.asset('assets/images/newshoes.png',width:170,fit: BoxFit.cover,),
                       ],
                     ),
                   ),
                   SizedBox(height: 15,),
                   Padding(
                     padding: const EdgeInsets.only(left:40),
                     child: Row(
                       children: [
                         Container(child: Padding(
                           padding: const EdgeInsets.only(top: 30),
                           child: Text('Accesories',style:TextStyle(fontWeight: FontWeight.bold)),
                         ),
                           height: 100,width: 162,),
                         Image.asset('assets/images/accesories.png'),
                       ],
                     ),
                   ),
                 ],
               ),

                 Text('Welcome2'),
                 Text('Welcome3')
               ]
               ),
             ),
           ),
           Visibility(visible: isvisible,
             child:
             Expanded(
               child: SingleChildScrollView(
                 child:
                 Padding(
                   padding: const EdgeInsets.all(15),
                     child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Container(width: 355,height:45,
                             child: ElevatedButton(style: ElevatedButton.styleFrom(
                               backgroundColor: Colors.red,),
                               onPressed: (){}, child:Text('VIEW ALL ITEMS',style: TextStyle(color: Colors.white),),)),
                         SizedBox(height: 15,),
                        Text('Choose category',style: (TextStyle(color: Colors.grey)),),
                        ListView.builder(itemBuilder: (context,index){
                             return InkWell(onTap: (){
                               inkwellfxn(index);
                             },
                               child: Container(height: 55,
                                 child: Padding(
                                   padding: const EdgeInsets.only(left: 15),
                                   child: Text(arrname[index],
                                     style: TextStyle(color: Colors.black),),
                                 ),
                               ),
                             );
                           },itemCount: arrname.length,shrinkWrap: true,physics: NeverScrollableScrollPhysics(),)
                       ],
                     ),
                   ),
               ),
             ),
             ),
         ],

       ),

       ),
     );

  }
  inkwellfxn(int index){
    switch(index){
      case 0:
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>WomenTops()));
    }

  }
}

