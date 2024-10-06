import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Package:flutter/foundation.dart';

class RangeProvider with ChangeNotifier{
  RangeValues values=RangeValues(0, 1);
  RangeLabels labels = RangeLabels('0', '1');

RangeValues get _values=>values;
 void setslider(RangeValues newvalue)
 {
values=newvalue;
labels = RangeLabels(newvalue.start.toString(), newvalue.end.toString());
notifyListeners();
 }
}