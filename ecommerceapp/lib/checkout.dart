import 'package:ecommerceapp/paymentmethods.dart';
import 'package:ecommerceapp/shippingadress.dart';
import 'package:ecommerceapp/success.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Checkout extends StatefulWidget {  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Padding(
        padding: const EdgeInsets.all(10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20,),
            Center(
              child: Row(
                children: [
                  IconButton(onPressed: (){}, icon:Icon(Icons.arrow_back_ios_new)),
                  SizedBox(width: 80,),
                  Text(
                    'Checkout',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,),),
                ],
              ),
            ),
              SizedBox(height: 20,),
            Text('Shipping Address',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Row(
                children: [
                  Text('Misbah Mushtaq',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                  SizedBox(width: 195,),
                  InkWell(onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ShippingAdress()));

                  },
                      child: Text('Change',style: TextStyle(color: Colors.red),)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text('Chanapora',style: TextStyle(fontSize: 14),),
            ),
            Padding(
              padding: const EdgeInsets.only(left:8.0),
              child: Text('Alnoor Colny,sgr,Kashmir',style: TextStyle(fontSize: 14)),
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                Text('Payment',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                SizedBox(width: 240,),
                InkWell(onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>PaymentMethods()));
                },
                    child: Text('Change',style: TextStyle(color: Colors.red),)),
              ],
            ),
            Row(
              children: [
                Image.asset('assets/images/card.png'),
                Text('**** **** ****3947')
              ],
            ),
            SizedBox(height: 20,),
            Text('Delivery Method',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
            Image.asset('assets/images/Deliverymethod1.png'),
            SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text('Order',style: TextStyle(color: Colors.grey,fontSize: 18),),
                  SizedBox(width:270,),
                  Text('112\$ ',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),),

                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text('Delivery',style: TextStyle(color: Colors.grey,fontSize: 18),),
                  SizedBox(width:250,),
                  Text('15\$ ',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text('Summary',style: TextStyle(color: Colors.grey,fontSize: 18),),
                  SizedBox(width:230,),
                  Text('127\$ ',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),),
                ],
              ),
            ),
            SizedBox(height: 30,),
            Container(width: 400,height:50,
              child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor:Colors.red),
                  onPressed: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Success()));
                  }, child: Text('SUBMIT ORDER',style: TextStyle(color: Colors.white),)),
            )


          ],
        ),
      )
    );
  }}
