import 'package:brew_crew/model/brew_model.dart';
import 'package:brew_crew/model/user.dart';
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

  //brewlist form snapshot
  List<Brew> _brewListFromSanpshot(QuerySnapshot snapshot) {
    return snapshot.documents.map(
      (e) {
        return Brew(
          name: e.data['name'] ?? '',
          strength: e.data['strength'] ?? 0,
          sugars: e.data['sugars'] ?? '0',
        );
      },
    ).toList();
  }

  //userData sanpshoot
  UserData _userDataFromSnapshoot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      name: snapshot.data['name'],
      strength: snapshot.data['strength'],
      sugars: snapshot.data['sugars'],
    );
  }

  // get brew stream if any data changes/updates
  /// Sanpshoot Method Notifies of query results at this location
  Stream<List<Brew>> get brews {
    return brewCollection.snapshots().map(_brewListFromSanpshot);
  }

  //get user doc stream
  Stream<UserData> get userData {
    return brewCollection.document(uid).snapshots().map(_userDataFromSnapshoot);
  }
}
