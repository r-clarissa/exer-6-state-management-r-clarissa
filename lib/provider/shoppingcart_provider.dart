import 'package:flutter/material.dart';
import '../model/Item.dart';

class ShoppingCart with ChangeNotifier { // for updating and notifying UI changes
  // variable declarations
  final List<Item> _shoppingList = [];
  double cartTotal = 0;
  List<Item> get cart => _shoppingList;

  // adds a new item to shopping list
  void addItem(Item item) {
    _shoppingList.add(item);
   cartTotal = cartTotal + item.price;
    notifyListeners();
  }

  // resets shopping list to initial state
  void removeAll() {
    _shoppingList.clear();
    cartTotal = 0;
    notifyListeners();
  }

  // deletes a selected item from shopping list
  void removeItem(String name) {
    for (int i = 0; i < _shoppingList.length; i++) {
      if (_shoppingList[i].name == name) {
        cartTotal = cartTotal - _shoppingList[i].price;
        _shoppingList.remove(_shoppingList[i]);
        break;
      }
    }
    notifyListeners();
  }
}
