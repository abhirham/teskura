import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:teskura/models/item.dart';
import 'package:teskura/models/room.dart';
import 'package:teskura/models/user.dart';

class DbService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Room>> fetchRooms(String uid) {
    return _firestore
        .collection('rooms')
        .where('users', arrayContains: uid)
        .get()
        .then((value) =>
            value.docs.map((doc) => Room.fromDocument(doc)).toList());
  }

  Stream<List<Item>> fetchItemsStream(String roomId) {
    print('rerendering personal list');
    print('rerendering personal list2');
    return _firestore
        .collection('rooms')
        .doc(roomId)
        .collection('shoppingList')
        .snapshots()
        .map((QuerySnapshot snapshot) =>
            snapshot.docs.map((doc) => Item.fromDocument(doc)).toList());
  }

  Future<List<Item>> fetchItemsList(String roomId) {
    return _firestore
        .collection('rooms')
        .doc(roomId)
        .collection('shoppingList')
        .get()
        .then((QuerySnapshot querySnapshot) => querySnapshot.docs
            .map((DocumentSnapshot doc) => Item.fromDocument(doc))
            .toList());
  }

  Future<void> updateItem(String roomId, Item item) async {
    return _firestore
        .collection('rooms')
        .doc(roomId)
        .collection('shoppingList')
        .doc(item.id)
        .set(item.toMap());
  }

  Future<DocumentSnapshot> fetchUserData(String uid) {
    return _firestore.collection('users').doc(uid).get();
  }

  Future<void> createUser(UserModel user) async {
    await _firestore.collection('users').doc(user.uid).set(user.toMap());
  }
}
