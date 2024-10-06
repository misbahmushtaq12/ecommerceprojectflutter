import 'package:ecommerceapp/addingshippingaddress.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShippingAdress extends StatefulWidget {  @override
  State<ShippingAdress> createState() => _ShippingAdressState();
}

class _ShippingAdressState extends State<ShippingAdress> {
  bool checked=false;
  bool checked1=false;
  bool checked2=false;
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    body:
    SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 30,),
          Center(
            child: Row(
              children: [
                IconButton(onPressed: (){}, icon:Icon(Icons.arrow_back_ios_new)),
                SizedBox(width: 50,),
                Text(
                  'Shipping Addresses',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,),),
      
              ],
            ),
          ),
          SizedBox(height: 25,),
          Container(height: 180,width: 385,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),  color: Colors.white,),
            child: Padding(
              padding: const EdgeInsets.only(left: 40,top: 10),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text('Misbah Mushtaq',style: TextStyle(fontWeight: FontWeight.bold),),
                      SizedBox(width: 180,),
                      InkWell(child: Text('Edit',style: TextStyle(color: Colors.red),))
                    ],
                  ),
                  Text('Chanapora'),
                  Text('Alnoor Colony Chanapora'),
                 Transform.translate(offset: Offset(-10, 0.0),
                    child:
                    CheckboxListTile(value:checked ,
                    title:Text('Use as default shipping address'),
                    activeColor: Colors.black,
                    onChanged: (val) {
                      setState(() {
                        checked = val!;
                        checked1=false;
                        checked2=false;
                      });
                    },controlAffinity: ListTileControlAffinity.leading,
                      contentPadding: EdgeInsets.only(left: 0),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 25,),
          Container(height: 180,width: 385,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),  color: Colors.white,),
            child: Padding(
              padding: const EdgeInsets.only(left: 40,top: 10),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text('Misbah Mushtaq',style: TextStyle(fontWeight: FontWeight.bold),),
                      SizedBox(width: 180,),
                      InkWell(child: Text('Edit',style: TextStyle(color: Colors.red),))
                    ],
                  ),
                  Text('Natipora'),
                  Text('BadshahNagar Natipora'),
                  Transform.translate(offset: Offset(-10, 0.0),
                    child:
                    CheckboxListTile(value:checked1 ,
                      title:Text('Use as default shipping address'),
                      activeColor: Colors.black,
                      onChanged: (val) {
                        setState(() {
                          checked1 = val!;
                          checked=false;
                          checked2=false;
                        });
                      },controlAffinity: ListTileControlAffinity.leading,
                      contentPadding: EdgeInsets.only(left: 0),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 25,),
          Container(height: 180,width: 385,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),  color: Colors.white,),
            child: Padding(
              padding: const EdgeInsets.only(left: 40,top: 10),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text('Misbah Mushtaq',style: TextStyle(fontWeight: FontWeight.bold),),
                      SizedBox(width: 180,),
                      InkWell(child: Text('Edit',style: TextStyle(color: Colors.red),))
                    ],
                  ),
                  Text('Chanapora'),
                  Text('Green Lane khan colony'),
                  Transform.translate(offset: Offset(-10, 0.0),
                    child:
                    CheckboxListTile(value:checked2 ,
                      title:Text('Use as default shipping address'),
                      activeColor: Colors.black,
                      onChanged: (val) {
                        setState(() {
                          checked2 = val!;
                          checked=false;
                          checked1=false;
                        });
                      },controlAffinity: ListTileControlAffinity.leading,
                      contentPadding: EdgeInsets.only(left: 0),
                    ),
                  ),
      
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 270),
            child: Container(
              decoration: BoxDecoration(color: Colors.black,shape: BoxShape.circle),
              child: IconButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> Addshipaddress ()));
              },icon: Icon(Icons.add,color: Colors.white,)),),
          )
        ],
      ),
    ),
  );
  }}
