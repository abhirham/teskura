import 'package:cloud_firestore/cloud_firestore.dart';

class DbService {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<QuerySnapshot> fetchRooms(String uid) async {
    return _firestore
        .collection('rooms')
        .where('users', arrayContains: uid)
        .get();
  }
}
