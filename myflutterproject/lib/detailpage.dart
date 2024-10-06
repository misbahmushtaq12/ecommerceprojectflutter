import 'package:flutter/material.dart';
class DetailProduct extends StatefulWidget{
  @override
State <DetailProduct> createState()=> _DetailProductState();}
class _DetailProductState extends State<DetailProduct>
{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text('Detail Product',style: TextStyle(fontWeight: FontWeight.bold),),
     ),


   );
  }


}

