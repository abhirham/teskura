import 'package:flutter/cupertino.dart';
import 'package:teskura/data/item.dart';

class Tasks extends ChangeNotifier {
  List<Item> items = [
    Item('Milk', false),
    Item('Eggs', false),
    Item('Curd', false),
    Item('Rice', false),
    Item('Bread', false),
  ];

  void addItem(String itemName) {
    items.add(Item(itemName, false));
    notifyListeners();
  }

  void updateItem(Item item, bool completed) {
    item.toggleChecked(completed);
    notifyListeners();
  }

  get itemCount => items.length;
}
