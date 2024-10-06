import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaymentMethods extends StatefulWidget {  @override
  State<PaymentMethods> createState() => _PaymentMethodsState();
}

class _PaymentMethodsState extends State<PaymentMethods> {
  bool checked=false;
  bool checked1=false;
  bool checked3=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body:
Padding(
  padding: const EdgeInsets.all(10),
  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(height: 30,),
      Center(
        child: Row(
          children: [
            IconButton(onPressed: (){}, icon:Icon(Icons.arrow_back_ios_new)),
            SizedBox(width: 50,),
            Text(
              'Payment Methods',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,),),
          ],
        ),
      ),
      SizedBox(height: 20,),
      Text('Your Payment Cards',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
      Image.asset('assets/images/Card1.png'),
      CheckboxListTile(value:checked ,
          title:Text('Use as default payment method'),
          activeColor: Colors.black,
          onChanged: (val){
        setState(() {
          checked=val!;

        });
      },controlAffinity: ListTileControlAffinity.leading,
      ),
      Image.asset('assets/images/Card 2.png'),
      CheckboxListTile(value:checked1 ,
        title:Text('Use as default payment method'),
        activeColor: Colors.black,
        onChanged: (val){
          setState(() {
            checked1=val!;

          });
        },controlAffinity: ListTileControlAffinity.leading,
      ),
      Padding(
        padding: const EdgeInsets.only(left: 350),
        child: Container(
          decoration: BoxDecoration(color: Colors.black,shape: BoxShape.circle),
            child: IconButton(onPressed: (){
              setState(() {
              showModalBottomSheet(context: context, builder:(BuildContext context){
                return StatefulBuilder(builder:(context,setStateSB){return
                  SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(
                        'Add new card',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,),),
                      SizedBox(height: 15,),
                      Container(height:60,width:350,color:Colors.white,
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                           label: Text('Name on card'),
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
                            label: Text('Card number'),
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
                            label: Text('Expiry Date'),
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
                            label: Text('CVV'),
                            labelStyle: TextStyle(color: Colors.grey),
                            contentPadding: EdgeInsets.symmetric(horizontal:20),
                            hintStyle: TextStyle(
                              color: Colors.grey,),
                  
                          ),
                        ),
                      ),
                      CheckboxListTile(value:checked3 ,
                        title:Text('Set as default payment method'),
                        activeColor: Colors.black,
                        onChanged: (val){
                          setStateSB(() {
                            checked3=val!;
                  
                          });
                        },controlAffinity: ListTileControlAffinity.leading,
                      ),
                      SizedBox(height: 30,),
                      Container(width: 400,height:50,
                        child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor:Colors.red),
                            onPressed: (){}, child: Text('ADD CARD',style: TextStyle(color: Colors.white),)),
                      ),
                      SizedBox(height: 10,)
                  
                  
                    ],
                  ),
                );});
              });
              });
            }, icon:Icon(Icons.add,color: Colors.white,))),

      )
    ],
  ),
)
    );
  }}
