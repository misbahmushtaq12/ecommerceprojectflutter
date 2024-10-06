import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrderDetails extends StatefulWidget {  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  @override
  Widget build(BuildContext context) {
    return
         Scaffold(
           body:

           Padding(
             padding: const EdgeInsets.only(left: 15),
             child: SingleChildScrollView(
               child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   SizedBox(height: 45),
                   TextField(
                     decoration: InputDecoration(
                       border: InputBorder.none,
                       suffixIcon: IconButton(icon: Icon(Icons.search), onPressed: () {}),
                       prefixIcon: IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: () {}),
                     ),
                   ),
                   SizedBox(height: 15,),
                   Text('Order No 1947034', style: TextStyle(fontWeight: FontWeight.bold)),
                   SizedBox(height: 10,),
                   Row(
                     children: [
                       Text('Tracking number:'),
                       Text('IW3475453455',style: TextStyle(fontWeight: FontWeight.bold),),
                     ],
                   ),
                   SizedBox(height: 10,),
                   Text(
                     '3 items',
                     style: TextStyle(fontWeight: FontWeight.bold),
                   ),
                   SizedBox(height: 15,),
                   Row(crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Image.asset('assets/images/photo@2x.png',height: 160,width: 170,fit: BoxFit.cover,),
                       Padding(
                         padding: const EdgeInsets.all(15),
                         child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Text('Pullover',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                             Text('Mango',style: TextStyle(color: Colors.grey),),
                             SizedBox(height: 7,),
                             Row(
                               children: [
                                 Row(
                                   children: [
                                     Text('Color:',style: TextStyle(color: Colors.grey),),
                                         Text('Gray'),
                                   ],
                                 ),
                                 SizedBox(width: 30,),
                                 Text('Size:L'),
                               ],
                             ),
                             SizedBox(height: 5,),
               
                             Row(
                               children: [
                                 Text('Units:',style: TextStyle(color: Colors.grey),),
                                     Text('1'),
                                 SizedBox(width: 110,),
                                 Text('51\$',style: TextStyle(fontWeight: FontWeight.bold),)
                               ],
                             ),
               
                           ],
                         ),
                       ),
                     ],
                   ),
                   SizedBox(height: 20,),
                   Row(crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Image.asset('assets/images/photo.png',height: 160,width: 170,fit: BoxFit.cover,),
                       Padding(
                         padding: const EdgeInsets.all(15),
                         child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Text('Pullover',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                             Text('Mango',style: TextStyle(color: Colors.grey),),
                             SizedBox(height: 7,),
                             Row(
                               children: [
                                 Row(
                                   children: [
                                     Text('Color:',style: TextStyle(color: Colors.grey),),
                                     Text('Gray'),
                                   ],
                                 ),
                                 SizedBox(width: 30,),
                                 Text('Size:L'),
                               ],
                             ),
                             SizedBox(height: 5,),
               
                             Row(
                               children: [
                                 Text('Units:',style: TextStyle(color: Colors.grey),),
                                 Text('1'),
                                 SizedBox(width: 110,),
                                 Text('51\$',style: TextStyle(fontWeight: FontWeight.bold),)
                               ],
                             ),
               
                           ],
                         ),
                       ),
                     ],
                   ),
                   SizedBox(height: 20,),
                   Row(crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Image.asset('assets/images/photo3.png',height: 160,width: 170,fit: BoxFit.cover,),
                       Padding(
                         padding: const EdgeInsets.all(15),
                         child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Text('Pullover',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                             Text('Mango',style: TextStyle(color: Colors.grey),),
                             SizedBox(height: 7,),
                             Row(
                               children: [
                                 Row(
                                   children: [
                                     Text('Color:',style: TextStyle(color: Colors.grey),),
                                     Text('Gray'),
                                   ],
                                 ),
                                 SizedBox(width: 30,),
                                 Text('Size:L'),
                               ],
                             ),
                             SizedBox(height: 5,),
               
                             Row(
                               children: [
                                 Text('Units:',style: TextStyle(color: Colors.grey),),
                                 Text('1'),
                                 SizedBox(width: 110,),
                                 Text('51\$',style: TextStyle(fontWeight: FontWeight.bold),)
                               ],
                             ),
               
                           ],
                         ),
                       ),
                     ],
                   ),
                   SizedBox(height: 20,),
                   Text('Order information',style: TextStyle(fontSize: 18),),
                   Row(
                     children: [
                       Text('Shipping Address:',style: TextStyle(color: Colors.grey),),
                       SizedBox(width: 20,),
                       Container(width: 234,
                           child: Text('Alnoor Colony Chanapora Srinagar near J&k bank ',style: TextStyle(fontWeight: FontWeight.bold),))
                     ],
                   ),
                   Row(
                     children: [
                       Text('Payment method:',style: TextStyle(color: Colors.grey),),
                       SizedBox(width:5,),
                       Image.asset('assets/images/card.png'),
                       Text('**** **** **** 3947',style: TextStyle(fontWeight: FontWeight.bold)),
               
                     ],
                   ),
                   Row(
                     children: [
                       Text('Delivery method:',style: TextStyle(color: Colors.grey),),
                       SizedBox(width:30,),
                       Text('Cash on delivery',style: TextStyle(fontWeight: FontWeight.bold))
               
                     ],
                   ),
                   SizedBox(height: 15,),
                   Row(
                     children: [
                       Text('Discount:',style: TextStyle(color: Colors.grey),),
                       SizedBox(width:78,),
                       Text('10% Personal promo code',style: TextStyle(fontWeight: FontWeight.bold))
               
                     ],
                   ),
                   SizedBox(height: 15,),
                   Row(
                     children: [
                       Text('Total Amount',style: TextStyle(color: Colors.grey),),
                       SizedBox(width:50,),
                       Text('133 \$',style: TextStyle(fontWeight: FontWeight.bold))
               
                     ],
                   ),
                   Padding(
                     padding: const EdgeInsets.all(20),
                     child: Row(
                       children: [
                         Container(width: 150,
                           child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.white,
                               side: BorderSide(color: Colors.black)),
                               onPressed: (){}, child: Text('Reorder',style: TextStyle(color: Colors.black))),
                         ),
                         SizedBox(width: 50,),
                         ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                             onPressed: (){}, child: Text('Leave feedback',style: TextStyle(color: Colors.white),)),
                       ],
                     ),
                   )
               
               
               
               
                 ],
               ),
             ),
           )
         );
  }}
