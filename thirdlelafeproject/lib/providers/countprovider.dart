import 'package:flutter/cupertino.dart';

class CountProvider with ChangeNotifier
{
  int _count=3;
  int get count=>_count;
  void getcount(){
    _count++;
    notifyListeners();

}

}