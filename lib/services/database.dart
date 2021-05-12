import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  // collection reference
  final CollectionReference brewCollection =
      Firestore.instance.collection('brews');
}
