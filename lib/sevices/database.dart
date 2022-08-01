import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firecourse/models/brew.dart';

class DatabaseService {
  // collection preferencs
  final String uid;
  DatabaseService({required this.uid});

  final CollectionReference brewCollection =
      FirebaseFirestore.instance.collection('brews');

  Future updateUserData(String sugars, String name, int strength) async {
    return await brewCollection.doc(uid).set({
      'sugars': sugars,
      "name": name,
      'strength': strength,
    });
  }

  // brew list firestore

  List _brews = [];

  // get stream brews
  Stream<QuerySnapshot> get brews {
    return brewCollection.snapshots();
  }
}
