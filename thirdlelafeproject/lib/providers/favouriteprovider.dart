import 'package:flutter/cupertino.dart';
import 'Package:flutter/foundation.dart';

class FavouriteProvider with ChangeNotifier{
  List  _ispressed=[];
  List  get ispressed  => _ispressed;

  void additem(int value){
    ispressed.add(value);
    notifyListeners();
  }
  void removeitem(int value){
    ispressed.remove(value);
    notifyListeners();
  }

}