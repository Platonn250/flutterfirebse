// ignore_for_file: prefer_const_constructors, avoid_print, sort_child_properties_last

import 'package:firecourse/sevices/auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  const SignIn({Key? key, required this.toggleView}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthServices _auth = AuthServices();
  // text field state
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        actions: <Widget>[
          ElevatedButton.icon(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.brown[300])),
              onPressed: () {
                widget.toggleView();
              },
              icon: Icon(Icons.person),
              label: Text("Register"))
        ],
        backgroundColor: Colors.brown[300],
        elevation: 0.0,
        title: Text("Sign in here"),
      ),
      body: Container(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
          child: Form(
            child: Column(children: [
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    email = value;
                  });
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    password = value;
                  });
                },
                obscureText: true,
              ),
              SizedBox(
                height: 20,
              ),
              // GestureDetector(
              //   onTap: () async {},
              //   child: Container(
              //     height: 50,
              //     width: MediaQuery.of(context).size.width,
              //     child: Center(
              //         child: Text(
              //       "Sign in",
              //       style: TextStyle(
              //         color: Colors.white70,
              //       ),
              //     )),
              //     decoration: BoxDecoration(
              //       gradient: LinearGradient(colors: [Colors.blue, Colors.red]),
              //       borderRadius: BorderRadius.circular(12),
              //     ),
              //   ),
              // ),
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.pink)),
                onPressed: () async {
                  print(email);
                  print(password);
                },
                child: Text("Sign In"),
              )
            ]),
          )),
    );
  }
}
