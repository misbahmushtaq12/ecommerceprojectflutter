import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:secondlelafeproject/provider/RangeProvider.dart';
import 'package:secondlelafeproject/screen/countexample.dart';

class Rangeslider extends StatefulWidget {  @override
  State<Rangeslider> createState() => _RangesliderState();
}
class _RangesliderState extends State<Rangeslider> {
  @override
  Widget build(BuildContext context) {
    final rangeprovider=Provider.of<RangeProvider>(context,listen:false);
    return
      Scaffold(
        body:Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<RangeProvider>(builder: (context,value,child){return
            RangeSlider(
                values:value.values,
                activeColor: Colors.red,
                  labels: rangeprovider.labels,
              divisions: 5,
              onChanged: (val){rangeprovider.setslider(val);
                });
              }),
            ElevatedButton(onPressed:() {Navigator.push(context, MaterialPageRoute(builder: (context)=>CounterExample()));},
            child: Text('click me'))
          ],
        ));



  }}
