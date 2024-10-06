import 'package:ecommerceapp/womenstop.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Success extends StatefulWidget {  @override
  State<Success> createState() => _SuccessState();
}

class _SuccessState extends State<Success> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 250,),
          Center(child: Image.asset('assets/images/bags.png')),
          SizedBox(height: 20,),
          Text('Success!',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
          Text('Your order will be delivered soon',style: TextStyle(fontSize: 15),),
          Text('Thank You For choosing our app!',style: TextStyle(fontSize: 15)),
          SizedBox(height: 120,),
          Container(width: 380,height:55,
            child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor:Colors.red),
                onPressed: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> WomenTops()));
                }, child: Text('CONTINUE SHOPPING',style: TextStyle(color: Colors.white),)),
          ),
          SizedBox(height: 10,)

        ],
      )
    );
  }}
