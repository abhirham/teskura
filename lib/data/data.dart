import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:teskura/models/item.dart';
import 'package:teskura/models/room.dart';
import 'package:teskura/services/db.dart';

class Data extends ChangeNotifier {
  final DbService _db = DbService();

  List<Room> _rooms = [];
  List<Item> _itemsList = [];
  Room selectedRoom;

  UnmodifiableListView<Room> get rooms => UnmodifiableListView(_rooms);
  UnmodifiableListView<Item> get itemsList => UnmodifiableListView(_itemsList);

  Future<void> fetchRooms({@required String uid, bool forceFetch}) async {
    if (_rooms.length > 0 && (forceFetch == null || !forceFetch)) return _rooms;
    _rooms = await _db.fetchRooms(uid);
    notifyListeners();
  }

  Future<void> fetchItems(String roomId) async {
    if (_itemsList.length > 0) return;
    _itemsList = await _db.fetchItemsList(roomId);
    notifyListeners();
  }

  Future<void> updateItem(Item item, bool val) async {
    if (selectedRoom.name == "Personal") {
      item.pickedUp = val;
      notifyListeners();
    }

    try {
      await _db.updateItem(selectedRoom.id, item);
    } catch (e) {
      print(e);
      if (selectedRoom.name == "Personal") {
        item.pickedUp = !val;
        notifyListeners();
      }
    }
  }
}
