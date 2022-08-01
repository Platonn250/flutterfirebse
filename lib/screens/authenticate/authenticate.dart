// ignore_for_file: prefer_const_constructors

import 'package:firecourse/screens/authenticate/register.dart';
import 'package:firecourse/screens/singin.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({Key? key}) : super(key: key);

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;
  void toggleView() {
    setState(() {
      showSignIn = !showSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    // if (showSignIn) {
    //   return SignIn();
    // } else {
    //   return Register();
    // }

    return showSignIn
        ? SignIn(toggleView: toggleView)
        : Register(toggleView: toggleView);
    // return Container(
    //   child: Register(),
    // );
  }
}
