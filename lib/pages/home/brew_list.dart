import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BrewList extends StatefulWidget {
  @override
  _BrewListState createState() => _BrewListState();
}

class _BrewListState extends State<BrewList> {
  @override
  Widget build(BuildContext context) {
    //fatching the all document's data from user's firebase
    final brew = Provider.of<QuerySnapshot>(context);
    for (var doc in brew.documents) {
      print(doc.data);
    }
    return Container();
  }
}
