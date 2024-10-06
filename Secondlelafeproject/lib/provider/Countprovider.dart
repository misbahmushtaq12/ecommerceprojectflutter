import 'package:flutter/cupertino.dart';
import 'Package:flutter/foundation.dart';
class CountProvider with ChangeNotifier{
  int _count=10;
  int get count=>_count;
  void setcount(){
    _count++;
    notifyListeners();
  }
}