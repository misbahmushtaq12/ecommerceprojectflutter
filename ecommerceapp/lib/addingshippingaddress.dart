import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Addshipaddress extends StatefulWidget {  @override
  State<Addshipaddress> createState() => _AddshipaddressState();
}

class _AddshipaddressState extends State<Addshipaddress> {
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    body:SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 40,),
          Center(
            child: Row(
              children: [
                IconButton(onPressed: (){}, icon:Icon(Icons.arrow_back_ios_new)),
                SizedBox(width: 40,),
                Text(
                  'Adding Shipping Address',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,),),
              ],
            ),
          ),
          SizedBox(height: 20,),
          Container(height:60,width:350,color:Colors.white,
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                label: Text('Full name'),
                labelStyle: TextStyle(color: Colors.grey),
                contentPadding: EdgeInsets.symmetric(horizontal:20),
                hintStyle: TextStyle(
                  color: Colors.grey,),
      
              ),
            ),
          ),
          SizedBox(height: 20,),
          Container(height:60,width:350,color:Colors.white,
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                label: Text('Address'),
                labelStyle: TextStyle(color: Colors.grey),
                contentPadding: EdgeInsets.symmetric(horizontal:20),
                hintStyle: TextStyle(
                  color: Colors.grey,),
      
              ),
            ),
          ),
          SizedBox(height: 20,),
          Container(height:60,width:350,color:Colors.white,
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                label: Text('City'),
                labelStyle: TextStyle(color: Colors.grey),
                contentPadding: EdgeInsets.symmetric(horizontal:20),
                hintStyle: TextStyle(
                  color: Colors.grey,),
      
              ),
            ),
          ),
          SizedBox(height: 20,),
          Container(height:60,width:350,color:Colors.white,
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                label: Text('State/province/Region'),
                labelStyle: TextStyle(color: Colors.grey),
                contentPadding: EdgeInsets.symmetric(horizontal:20),
                hintStyle: TextStyle(
                  color: Colors.grey,),
      
              ),
            ),
          ),
          SizedBox(height: 20,),
          Container(height:60,width:350,color:Colors.white,
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                label: Text('Zip Code (Postal Code)'),
                labelStyle: TextStyle(color: Colors.grey),
                contentPadding: EdgeInsets.symmetric(horizontal:20),
                hintStyle: TextStyle(
                  color: Colors.grey,),
      
              ),
            ),
          ),
          SizedBox(height: 20,),
          Container(height:60,width:350,color:Colors.white,
            child: TextField(
              decoration: InputDecoration(
                suffixIcon: Icon(Icons.arrow_forward_ios_rounded),
                border: InputBorder.none,
                label: Text('Country'),
                labelStyle: TextStyle(color: Colors.grey),
                contentPadding: EdgeInsets.symmetric(horizontal:20),
                hintStyle: TextStyle(
                  color: Colors.grey,),
      
              ),
            ),
          ),
          SizedBox(height: 50,),
          Container(width: 400,height:50,
            child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor:Colors.red),
                onPressed: (){}, child: Text('SAVE ADDRESS',style: TextStyle(color: Colors.white),)),
          ),
          SizedBox(height: 10,)
      
      
        ],
      ),
    ),

  );
  }}
