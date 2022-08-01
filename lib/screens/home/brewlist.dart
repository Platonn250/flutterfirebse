import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class BrewList extends StatefulWidget {
  const BrewList({Key? key}) : super(key: key);

  @override
  State<BrewList> createState() => _BrewListState();
}

class _BrewListState extends State<BrewList> {
  Future getData() async {
    FirebaseFirestore.instance.collection('brews').get().then((value) {
      value.docs.forEach((element) {
        print(element['name']);
        print(element['strength']);
        print(element['sugars']);
      });
    });
  }

  @override
  void didChangeDependencies() async {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    await getData();
  }

  @override
  Widget build(BuildContext context) {
    // final brews = Provider.of<QuerySnapshot<Map<String, dynamic>>>(context);
    // final brews = Provider.of<QuerySnapshot>(context);

    // for (var doc in brews.docs) {
    //   print(doc);
    // }
    return Container();
  }
}
