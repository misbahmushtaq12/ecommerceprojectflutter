import 'package:ecommerceapp/orderdetails.dart';
import 'package:ecommerceapp/sametextstyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class MyOrders extends StatefulWidget {
  @override
  State<MyOrders> createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 45),
            TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                suffixIcon: IconButton(icon: Icon(Icons.search), onPressed: () {}),
                prefixIcon: IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: () {}),
              ),
            ),
          //  SizedBox(height:,),
            Padding(
              padding: const EdgeInsets.only(left:15),
              child: Text('My Orders',style: SameTextStyle.heading,),
            ),
            SizedBox(height:1,),
            TabBar(
              indicatorColor: Colors.black,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.black,
              tabs: [
                Tab(text: 'Delivered'),
                Tab(text: 'Processing'),
                Tab(text: 'Cancelled'),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  DeliveredTabContent(),
                  ProcessingTabContent(),
                  CancelledTabContent(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DeliveredTabContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 30,),
        Container(
          height: 180,
          width: 385,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 40, top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Row(
                      children: [
                        Text('Order No 1947034', style: TextStyle(fontWeight: FontWeight.bold)),
                        SizedBox(width: 130,),
                        Text('31-01-2024',style: TextStyle(color: Colors.grey),)
                      ],
                    ),

                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Text('Tracking number:'),
                    Text('IW3475453455',style: TextStyle(fontWeight: FontWeight.bold),),
                  ],
                ),
               SizedBox(height: 8,),
                Row(
                  children: [
                    Text(
                      'Quantity: ',
                      style: TextStyle(fontWeight: FontWeight.normal),
                    ),
                    Text(
                      '3',
                      style: TextStyle(fontWeight: FontWeight.bold,),),
                    SizedBox(width: 100,),
                    Text('Total Amount: ', style: TextStyle(color: Colors.grey),),
                    Text('112\$',style: TextStyle(fontWeight: FontWeight.bold),)
                  ],
                ),
                SizedBox(height: 8,),
                Row(
                  children: [
                    ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.white,
                    side: BorderSide(color: Colors.black)),
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> OrderDetails ()));
                        }, child:Text('Details',style: TextStyle(color: Colors.black),)),
                    SizedBox(width: 160,),
                    Text('Delivered', style: TextStyle(color: Colors.green)),
                  ],
                )

              ],
            ),
          ),
        ),
        SizedBox(height: 30,),
        Container(
          height: 180,
          width: 385,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 40, top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Row(
                      children: [
                        Text('Order No 1947034', style: TextStyle(fontWeight: FontWeight.bold)),
                        SizedBox(width: 130,),
                        Text('31-01-2024',style: TextStyle(color: Colors.grey),)
                      ],
                    ),

                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Text('Tracking number:'),
                    Text('IW3475453455',style: TextStyle(fontWeight: FontWeight.bold),),
                  ],
                ),
                SizedBox(height: 8,),
                Row(
                  children: [
                    Text(
                      'Quantity: ',
                      style: TextStyle(fontWeight: FontWeight.normal),
                    ),
                    Text(
                      '3',
                      style: TextStyle(fontWeight: FontWeight.bold,),),
                    SizedBox(width: 100,),
                    Text('Total Amount: ', style: TextStyle(color: Colors.grey),),
                    Text('112\$',style: TextStyle(fontWeight: FontWeight.bold),)
                  ],
                ),
                SizedBox(height: 8,),
                Row(
                  children: [
                    ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.white,
                        side: BorderSide(color: Colors.black)),
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> OrderDetails ()));
                        }, child:Text('Details',style: TextStyle(color: Colors.black),)),
                    SizedBox(width: 160,),
                    Text('Delivered', style: TextStyle(color: Colors.green)),
                  ],
                )

              ],
            ),
          ),
        ),
        SizedBox(height: 30,),
        Container(
          height: 180,
          width: 385,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 40, top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Row(
                      children: [
                        Text('Order No 1947034', style: TextStyle(fontWeight: FontWeight.bold)),
                        SizedBox(width: 130,),
                        Text('31-01-2024',style: TextStyle(color: Colors.grey),)
                      ],
                    ),

                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Text('Tracking number:'),
                    Text('IW3475453455',style: TextStyle(fontWeight: FontWeight.bold),),
                  ],
                ),
                SizedBox(height: 8,),
                Row(
                  children: [
                    Text(
                      'Quantity: ',
                      style: TextStyle(fontWeight: FontWeight.normal),
                    ),
                    Text(
                      '3',
                      style: TextStyle(fontWeight: FontWeight.bold,),),
                    SizedBox(width: 100,),
                    Text('Total Amount: ', style: TextStyle(color: Colors.grey),),
                    Text('112\$',style: TextStyle(fontWeight: FontWeight.bold),)
                  ],
                ),
                SizedBox(height: 8,),
                Row(
                  children: [
                    ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.white,
                        side: BorderSide(color: Colors.black)),
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> OrderDetails ()));
                        }, child:Text('Details',style: TextStyle(color: Colors.black),)),
                    SizedBox(width: 160,),
                    Text('Delivered', style: TextStyle(color: Colors.green)),
                  ],
                )

              ],
            ),
          ),
        ),
      ],
    );
  }
}

class ProcessingTabContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Content for Processing Tab'),
    );
  }
}

class CancelledTabContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Content for Cancelled Tab'),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: MyOrders(),
  ));
}

