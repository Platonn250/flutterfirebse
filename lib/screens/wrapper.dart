// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firecourse/models/user.dart';
import 'package:firecourse/screens/authenticate/authenticate.dart';
import 'package:firecourse/screens/home/home.dart';
import 'package:firecourse/screens/authenticate/singin.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<MyUser?>(context);
    print((user));
    // retunr home or authentiae
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
