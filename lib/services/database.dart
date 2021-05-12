import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  final String uid;
  Database({this.uid});

  // collection reference
  final CollectionReference brewCollection =
      Firestore.instance.collection('brews');
  Future updateUserData(String sugars, String name, int strength) async {
    return await brewCollection
        .document(uid)
        .setData({'sugars': sugars, 'name': name, 'strength': strength});
  }
}
