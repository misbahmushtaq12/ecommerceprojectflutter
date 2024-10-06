import 'package:flutter/cupertino.dart';

import 'modules/PostModel.dart';

class FavouriteProvider with ChangeNotifier {
  List _selectedeitem = [];
  List  get selecteditem=>_selectedeitem;

  void removeitem(int value){
    selecteditem.remove(value);
    notifyListeners();
  }

  void additem(int value){
    selecteditem.add(value);
    notifyListeners();
  }
}