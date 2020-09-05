import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class Room {
  final String name;
  final String id;

  Room({
    @required this.name,
    @required this.id,
  });

  factory Room.fromDocument(DocumentSnapshot doc) {
    Map data = doc.data();
    return Room(
      name: data['name'],
      id: doc.id,
    );
  }
}
