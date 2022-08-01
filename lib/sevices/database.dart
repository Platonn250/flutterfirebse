import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

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

  // get stream brews
  Stream<QuerySnapshot> get bews {
    return brewCollection.snapshots();
  }
}
