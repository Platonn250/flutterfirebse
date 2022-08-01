import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DatabaseService {
  // collection preferencs

  final CollectionReference brewCollection =
      FirebaseFirestore.instance.collection('brews');
}
