import 'package:ecommerceapp/sametextstyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {

  @override
  List<bool>isswitched=List.generate(3, (index) => false);
  Widget build(BuildContext context) {
   return Scaffold(
     body:
     Padding(
       padding: const EdgeInsets.all(20),
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
             Padding(
               padding: const EdgeInsets.only(left:0),
               child: Text('Settings',style: SameTextStyle.heading,),
             ),
             Text('Personal Information',style:TextStyle(fontWeight: FontWeight.bold),),
             SizedBox(height: 15,),
             Container(height:60,width:350,color:Colors.white,
               child: TextField(
                 decoration: InputDecoration(
                   border: InputBorder.none,
                   label: Text('Full Name'),
                   labelStyle: TextStyle(color: Colors.grey),
                   contentPadding: EdgeInsets.symmetric(horizontal:20),
                   hintStyle: TextStyle(
                     color: Colors.grey,),
         
                 ),
               ),
             ),
             SizedBox(height: 15,),
             Container(height:60,width:350,color:Colors.white,
               child: TextField(
                 decoration: InputDecoration(
                   border: InputBorder.none,
                   label: Text('Date of Birth'),
                   labelStyle: TextStyle(color: Colors.grey),
                   contentPadding: EdgeInsets.symmetric(horizontal:20),
                   hintStyle: TextStyle(
                     color: Colors.grey,),
         
                 ),
               ),
             ),
             SizedBox(height: 50,),
             Row(
               children: [
                 Text('Password',style:TextStyle(fontWeight: FontWeight.bold),),
                 SizedBox(width: 230,),
                 InkWell(onTap: (){
                     showModalBottomSheet(context: context, builder:(BuildContext bottomSheetContext){
                       return Builder(builder:(BuildContext newcontext){return
                         SingleChildScrollView(
                           child: Container(width: 400,
                             child: Column(
                               children: [
                                 Text(
                                   'Password Change',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,),),
                                 SizedBox(height: 15,),
                                 Container(height:60,width:350,color:Colors.white,
                                   child: TextField(
                                     decoration: InputDecoration(
                                       border: InputBorder.none,
                                       label: Text('Old Password'),
                                       labelStyle: TextStyle(color: Colors.grey),
                                       contentPadding: EdgeInsets.symmetric(horizontal:20),
                                       hintStyle: TextStyle(
                                         color: Colors.grey,),

                                     ),
                                   ),
                                 ),
                                 SizedBox(height: 5,),
                                 Padding(
                                   padding: const EdgeInsets.only(left: 180),
                                   child: InkWell(onTap: (){},
                                       child: Text('Forgot Password',style: TextStyle(color: Colors.grey),)),
                                 ),
                                 SizedBox(height: 15,),
                                 Container(height:60,width:350,color:Colors.white,
                                   child: TextField(
                                     decoration: InputDecoration(
                                       border: InputBorder.none,
                                       label: Text('New Password'),
                                       labelStyle: TextStyle(color: Colors.grey),
                                       contentPadding: EdgeInsets.symmetric(horizontal:20),
                                       hintStyle: TextStyle(
                                         color: Colors.grey,),

                                     ),
                                   ),
                                 ),
                                 SizedBox(height: 15,),
                                 Container(height:60,width:350,color:Colors.white,
                                   child: TextField(
                                     decoration: InputDecoration(
                                       border: InputBorder.none,
                                       label: Text('Repeat New Password'),
                                       labelStyle: TextStyle(color: Colors.grey),
                                       contentPadding: EdgeInsets.symmetric(horizontal:20),
                                       hintStyle: TextStyle(
                                         color: Colors.grey,),

                                     ),
                                   ),
                                 ),
                                 SizedBox(height: 30,),
                                 Container(width:350,height:50,
                                   child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor:Colors.red),
                                       onPressed: (){}, child: Text('Save Password',style: TextStyle(color: Colors.white),)),
                                 ),
                                 SizedBox(height: 10,)


                               ],
                             ),
                           ),
                         );});
                     });

                 },
                     child: Text('Change',style: TextStyle(color: Colors.grey),
                 ))
               ],
             ),
             SizedBox(height: 10,),
             Container(height:60,width:350,color:Colors.white,
               child: TextField(
                 obscureText: true,
                 obscuringCharacter: '*',
                 decoration: InputDecoration(
                   border: InputBorder.none,
                   label: Text('Password'),
                   labelStyle: TextStyle(color: Colors.grey),
                   contentPadding: EdgeInsets.symmetric(horizontal:20),
                   hintStyle: TextStyle(
                     color: Colors.grey,),
         
                 ),
               ),
             ),
             ListTile(
               title: Text('Sales'),
               trailing: Switch.adaptive(
                 value: isswitched[0],
                 activeColor: Colors.green,
                 activeTrackColor: Colors.white,
                 inactiveTrackColor: Colors.white,
                 inactiveThumbColor: Colors.grey,
                 onChanged: (newvalue){setState(() {
                   isswitched[0]=newvalue;
                 });
                 },
               ),
             ),
         
             ListTile(
               title: Text('New Arrivals'),
               trailing: Switch.adaptive(
                 value: isswitched[1],
                 activeColor: Colors.green,
                 activeTrackColor: Colors.white,
                 inactiveTrackColor: Colors.white,
                 inactiveThumbColor: Colors.grey,
                 onChanged: (newvalue){setState(() {
                   isswitched[1]=newvalue;
                 });
                 },
               ),
             ),
             ListTile(
               title: Text('Delivery status changes'),
               trailing: Switch.adaptive(
                 value: isswitched[2],
         
                 activeColor: Colors.green,
                 activeTrackColor: Colors.white,
                 inactiveTrackColor: Colors.white,
                 inactiveThumbColor: Colors.grey,
                 onChanged: (newvalue){setState(() {
                   isswitched[2]=newvalue;
                 });
                 },
               ),
             ),
         
           ],
         ),
       ),
     )
   );
  }}
