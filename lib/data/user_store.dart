import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:teskura/models/user.dart';
import 'package:teskura/services/db.dart';

class UserStore extends ChangeNotifier {
  DbService _db = DbService();
  UserModel user;

  Future<void> fetchUserData(String uid) async {
    DocumentSnapshot doc = await _db.fetchUserData(uid);
    if (doc.exists) {
      user = UserModel.fromDocument(doc);
      notifyListeners();
    }
  }

  Future<void> createUser({String name, String uid}) async {
    final UserModel user = UserModel(displayName: name, uid: uid);
    await _db.createUser(user);
    this.user = user;
    notifyListeners();
  }
}
