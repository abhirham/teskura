import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class Item {
  final String name;
  final String id;
  bool pickedUp;
  final String addedBy;

  Item({
    @required this.id,
    @required this.name,
    @required this.pickedUp,
    @required this.addedBy,
  });

  factory Item.fromDocument(DocumentSnapshot doc) {
    Map data = doc.data();

    return Item(
        id: doc.id,
        name: data['name'],
        pickedUp: data['pickedUp'],
        addedBy: data['addedBy']);
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'pickedUp': pickedUp,
      'addedBy': addedBy,
    };
  }
}
