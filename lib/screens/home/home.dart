import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firecourse/screens/home/brewlist.dart';
import 'package:firecourse/sevices/auth.dart';
import 'package:firecourse/sevices/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  final AuthServices _auth = AuthServices();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<QuerySnapshot?>.value(
      value: DatabaseService(uid: '').bews,
      initialData: null,
      child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: Text("brew"),
          elevation: 0.0,
          backgroundColor: Colors.brown[400],
          actions: [
            TextButton.icon(
                onPressed: () async {
                  await _auth.signOut();
                },
                icon: Icon(Icons.person),
                label: Text("Logout"))
          ],
        ),
        body: BrewList(),
      ),
    );
  }
}
