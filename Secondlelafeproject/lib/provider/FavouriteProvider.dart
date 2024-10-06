import 'package:flutter/cupertino.dart';
import 'Package:flutter/foundation.dart';

class FavouriteProvider with ChangeNotifier{
  List<int> _selecteditem=[];
  List<int> get selecteditem => _selecteditem;

  void additem(int value){
    selecteditem.add(value);
    notifyListeners();
  }
  void removeitem(int value){
    selecteditem.remove(value);
    notifyListeners();
  }

}