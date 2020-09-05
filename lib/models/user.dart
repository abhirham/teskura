import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class UserModel {
  final String displayName;
  final String uid;

  UserModel({@required this.displayName, @required this.uid});

  factory UserModel.fromDocument(DocumentSnapshot doc) {
    Map data = doc.data();
    return UserModel(
      displayName: data['displayName'],
      uid: data['uid'],
    );
  }

  Map<String, dynamic> toMap() {
    return {'displayName': displayName, 'uid': uid};
  }
}
