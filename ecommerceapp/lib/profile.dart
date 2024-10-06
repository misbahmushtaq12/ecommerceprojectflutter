import 'package:ecommerceapp/myorders.dart';
import 'package:ecommerceapp/sametextstyle.dart';
import 'package:ecommerceapp/settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            SizedBox(height: 65,),
            Text('My Profile',style: SameTextStyle.heading,),
            Row(
              children: [
                CircleAvatar(
                  backgroundColor:Colors.green,
                  radius: 50,
                  backgroundImage: AssetImage('assets/images/img.png'),
                ),
                SizedBox(width: 20,),
                Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Misbah Mushtaq',style: TextStyle(fontWeight: FontWeight.bold),),
                    Text('misbahmushtaq30@gmail.com',style: TextStyle(color: Colors.grey),)
                  ],
                ),
              ],
            ),
            ListTile(
              title: Text('My Orders',style: TextStyle(fontWeight: FontWeight.bold),),
              subtitle: Text('Already have 12 orders',style: TextStyle(color: Colors.grey),),
              trailing: Icon(Icons.arrow_forward_ios_rounded,color: Colors.grey,),
                contentPadding: EdgeInsets.symmetric(vertical: 5),
              onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> MyOrders ()));},
            ),
            ListTile(
                title: Text('Shipping addresses',style: TextStyle(fontWeight: FontWeight.bold),),
                subtitle: Text('3 addresses',style: TextStyle(color: Colors.grey),),
                trailing: Icon(Icons.arrow_forward_ios_rounded,color: Colors.grey,),
              contentPadding: EdgeInsets.symmetric(vertical: 5),
            ),
            ListTile(
                title: Text('Payment methods',style: TextStyle(fontWeight: FontWeight.bold),),
                subtitle: Text('Visa.**34',style: TextStyle(color: Colors.grey),),
                trailing: Icon(Icons.arrow_forward_ios_rounded,color: Colors.grey,),
              contentPadding: EdgeInsets.symmetric(vertical: 5),
            ),
            ListTile(
                title: Text('Promocodes',style: TextStyle(fontWeight: FontWeight.bold),),
                subtitle: Text('You have special promocodes',style: TextStyle(color: Colors.grey),),
                trailing: Icon(Icons.arrow_forward_ios_rounded,color: Colors.grey,),
              contentPadding: EdgeInsets.symmetric(vertical: 5),
            ),
            ListTile(
                title: Text('My reviews',style: TextStyle(fontWeight: FontWeight.bold),),
                subtitle: Text('Reviews for 4 items',style: TextStyle(color: Colors.grey),),
                trailing: Icon(Icons.arrow_forward_ios_rounded,color: Colors.grey,),
              contentPadding: EdgeInsets.symmetric(vertical: 5),
            ),
            ListTile(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> Settings()));
              },
                title: Text('Settings',style: TextStyle(fontWeight: FontWeight.bold),),
                subtitle: Text('Notifications,password',style: TextStyle(color: Colors.grey),),
                trailing: Icon(Icons.arrow_forward_ios_rounded,color: Colors.grey,),
              contentPadding: EdgeInsets.symmetric(vertical: 5),
            ),
          ],
        ),
      )
    );
  }}
