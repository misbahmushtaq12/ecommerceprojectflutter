import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class  RangeProvider extends ChangeNotifier{
  RangeValues _values=RangeValues(0, 1);
  RangeLabels labels= RangeLabels('0','1');
  RangeValues get values=>_values;
   void changeslider(newvalues){
     _values=newvalues;
     labels=RangeLabels(newvalues.start.toString(), newvalues.end.toString());
   notifyListeners();

   }
}