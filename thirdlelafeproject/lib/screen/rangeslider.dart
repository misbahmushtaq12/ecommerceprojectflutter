import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thirdlelafeproject/providers/rangeprovider.dart';

class RangeSlider1  extends StatefulWidget{
  @override
  State<RangeSlider1> createState() => _RangeSliderState1();
}

class _RangeSliderState1 extends State<RangeSlider1> {
  @override
  Widget build(BuildContext context) {

    final rangeprovider=Provider.of<RangeProvider>(context,listen: false);
    return Scaffold(
      body:
        Consumer<RangeProvider>(builder: (context,value,child)
            {return
      RangeSlider(
        values: value.values,
        labels: value.labels,
        divisions: 10,
        onChanged: (newvalue){

        value.changeslider(newvalue);
          });}
    )

      );
  }
}