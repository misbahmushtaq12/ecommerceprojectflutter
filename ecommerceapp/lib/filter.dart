import 'package:ecommerceapp/brands.dart';
import 'package:ecommerceapp/womenstop.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Filter extends StatefulWidget {  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  RangeValues values=RangeValues(0, 100);
  @override
  bool ispressed=false;
  bool ispressed1=false;
  bool ispressed2=false;
  bool ispressed3=false;
  bool ispressed4=false;
  bool ispressed5=false;
  Widget build(BuildContext context) {
    RangeLabels labels=RangeLabels(values.start.toString(),values.end.toString());

    return Scaffold(
      body:Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 60,),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Row(
                children: [
                  IconButton(icon:Icon(Icons.arrow_back_ios),onPressed: (){
                    showModalBottomSheet(context: context, builder:(BuildContext context){
                      return Container(height: 100,
                        child: Row(
                          children: [
                            Container(width:180,
                                child: ElevatedButton(onPressed: (){
                                  setState(() {
                                    Navigator.pop(context);
                                  });
                                }, child: Text('Discard',style:
                                TextStyle(color: Colors.black),),)),
                            SizedBox(width:50,),
                            Container(width:180,
                                child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.red)
                                    ,onPressed: (){
                                      Navigator.push(context,MaterialPageRoute(builder: (context)=>WomenTops()));
                                    }, child: Text('Apply',style: TextStyle(color: Colors.white),)))],
                        ),
                      );});
                  },),
                  SizedBox(width: 120,),
                  Text('Filters',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                ],
              ),
            ),

            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Price range',style: (TextStyle(fontWeight: FontWeight.bold)),),
            ),
            SizedBox(height: 20,),
            Row(mainAxisAlignment:MainAxisAlignment.spaceBetween ,
              children: [
                Text("\$ ${values.start}",style: TextStyle(fontWeight: FontWeight.bold),),
                Text('\$ ${values.end}',style: TextStyle(fontWeight: FontWeight.bold),),
              ],
            ),
            Center(child: RangeSlider(
                values: values,labels: labels,
                divisions: 5,
                min: 0,
                max: 100,
                activeColor: Colors.red,
                onChanged: (newvalue){
              values=newvalue;
                setState(() {

                });
                })),
            SizedBox(height: 20,),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Colors',style: (TextStyle(fontWeight: FontWeight.bold)),),
        ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(height: 36,width: 36,
                    child: ElevatedButton(
                      onPressed: (){
                        setState(() {
                          ispressed=!ispressed;
                        });
                      }, child:Text(''),style: ElevatedButton.styleFrom(side: BorderSide(color: ispressed ? Colors.red :Colors.black54 ),
                        backgroundColor: Colors.black54,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18)
                      )
                    ),
                    ),
                  ),
                  Container(height: 36,width: 36,
                    child: ElevatedButton(onPressed:(){ispressed1=!ispressed1;}, child: Text(''),style:
                      ElevatedButton.styleFrom(side: BorderSide(color: ispressed1 ? Colors.red :Colors.black54 ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18)
                        )
                      ),),
                  ),
                  Container(height: 36,width: 36,
                    child: ElevatedButton(onPressed:(){ispressed2=!ispressed2;}, child: Text(''),style:
                    ElevatedButton.styleFrom(side: BorderSide(color: ispressed2 ? Colors.red :Colors.black54 ),
                        backgroundColor: Colors.red,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18)
                        )
                    ),),
                  ),
                  Container(height: 36,width: 36,
                    child: ElevatedButton(onPressed:(){ispressed3=!ispressed3;}, child: Text(''),style:
                    ElevatedButton.styleFrom(side: BorderSide(color: ispressed3 ? Colors.red :Colors.black54 ),
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18)
                        )
                    ),),
                  ),
                  Container(height: 36,width: 36,
                    child: ElevatedButton(onPressed:(){ispressed4=!ispressed4;}, child: Text(''),style:
                    ElevatedButton.styleFrom(side: BorderSide(color: ispressed4 ? Colors.red :Colors.black54 ),
                        backgroundColor: Colors.grey,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18)
                        )
                    ),),
                  ),
                  Container(height: 36,width: 36,
                    child: ElevatedButton(onPressed:(){ispressed5=!ispressed5;}, child: Text(''),style:
                    ElevatedButton.styleFrom(side: BorderSide(color: ispressed5 ? Colors.red :Colors.black54 ),
                        backgroundColor: Colors.amber,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18)
                        )
                    ),),
                  ),

                  
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Sizes',style: (TextStyle(fontWeight: FontWeight.bold)),),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(height: 38,width:60,
                    child: ElevatedButton(
                      onPressed: (){}, child:Text('XS',style: TextStyle(fontSize:10,color: Colors.black54),),style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)
                        )
                    ),
                    ),
                  ),
                  Container(height: 38,width:60,
                    child: ElevatedButton(
                      onPressed: (){}, child:Text('S',style: TextStyle(fontSize:10,color: Colors.black54),),style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)
                        )
                    ),
                    ),
                  ),
                  Container(height: 38,width:60,
                    child: ElevatedButton(
                      onPressed: (){}, child:Text('M',style: TextStyle(fontSize:10,color: Colors.black54),),style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)
                        )
                    ),
                    ),
                  ),
                  Container(height: 38,width:60,
                    child: ElevatedButton(
                      onPressed: (){}, child:Text('L',style: TextStyle(fontSize:10,color: Colors.black54),),style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)
                        )
                    ),
                    ),
                  ),
                  Container(height: 38,width:60,
                    child: ElevatedButton(
                      onPressed: (){}, child:Text('XL',style: TextStyle(fontSize:10,color: Colors.black54),),style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)
                        )
                    ),
                    ),
                  ),
                  SizedBox(height: 10,),
                ],
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Category',style: (TextStyle(fontWeight: FontWeight.bold)),),
            ),
            SizedBox(height: 20,),
            Wrap(spacing: 40,
              runSpacing: 20,
              children: [
                Container(height: 40,width: 100,
                    child: ElevatedButton(onPressed:(){}, child: Text('All',style:TextStyle(color: Colors.white),),
                    style:ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)
                      )
                    ) ,)),
                Container(height: 40,width: 100,
                    child: ElevatedButton(onPressed:(){}, child: Text('Women',style:TextStyle(color: Colors.white),),
                      style:ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)
                          )
                      ) ,)),
                Container(height: 40,width: 100,
                    child: ElevatedButton(onPressed:(){}, child: Text('men',style:TextStyle(color: Colors.white),),
                      style:ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)
                          )
                      ) ,)),
                Container(height: 40,width: 100,
                    child: ElevatedButton(onPressed:(){}, child: Text('Boys',style:TextStyle(color: Colors.white),),
                      style:ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)
                          )
                      ) ,)),
                Container(height: 40,width: 100,
                    child: ElevatedButton(onPressed:(){}, child: Text('girls',style:TextStyle(color: Colors.white),),
                      style:ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)
                          )
                      ) ,))

              ],
            ),
            SizedBox(height: 50,),
            ListTile(
                onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>MyCheckboxList()));},
              title: Text('Brand',style: TextStyle(fontWeight: FontWeight.bold),),
              trailing: IconButton(icon: Icon(Icons.arrow_forward_ios),onPressed:() {Navigator.push(context, MaterialPageRoute(builder: (context)=>MyCheckboxList()));}
            )
            )
          ],
        ),
      )
    );
  }}