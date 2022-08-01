// ignore_for_file: prefer_const_constructors

import 'package:firecourse/sevices/auth.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  const Register({Key? key, required this.toggleView}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthServices _auth = AuthServices();
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
              label: Text("Sign in"))
        ],
        backgroundColor: Colors.brown[300],
        elevation: 0.0,
        title: Text("Register here"),
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
                child: Text("Register"),
              )
            ]),
          )),
    );
  }
}
