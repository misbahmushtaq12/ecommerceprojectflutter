import 'package:flutter/cupertino.dart';

import 'modules/PostModel.dart';

class BagProvider with ChangeNotifier {
  List _CartSelected = [];
  List  get CartSelected=>_CartSelected;


  void additem1(int value){
    CartSelected.add(value);
    notifyListeners();
  }
  void removeitem1(int value){
     CartSelected.remove(value);
    notifyListeners();
  }
}