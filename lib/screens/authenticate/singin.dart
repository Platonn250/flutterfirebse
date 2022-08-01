// ignore_for_file: prefer_const_constructors, avoid_print, sort_child_properties_last

import 'package:firecourse/sevices/auth.dart';
import 'package:firecourse/sharedcodes/constants.dart';
import 'package:firecourse/sharedcodes/loadin.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  const SignIn({Key? key, required this.toggleView}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  final AuthServices _auth = AuthServices();
  bool loading = false;

  // text field state
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
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
                  key: _formKey,
                  child: Column(children: [
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      cursorColor: Colors.black,
                      // style: TextStyle(color: Colors.red, fontSize: 16),
                      decoration:
                          textInputDecoration.copyWith(hintText: 'Email'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter username';
                        } else {
                          return null;
                        }
                      },
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
                      decoration:
                          textInputDecoration.copyWith(hintText: 'Password'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter password';
                        } else if (value.length <= 6) {
                          return "password Must be > 6 chars";
                        } else {
                          return null;
                        }
                      },
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
                          backgroundColor:
                              MaterialStateProperty.all(Colors.pink)),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            loading = true;
                          });
                          dynamic result = await _auth
                              .signInWithEmailAndPassword(email, password);
                          // print("valid");
                          if (result == null) {
                            setState(() {
                              error = "Can't Signin";
                              loading = false;
                            });
                          }
                        }
                        ;
                      },
                      child: Text("Sign In"),
                    ),
                    SizedBox(height: 20),
                    Text(
                      error,
                      style: TextStyle(color: Colors.red, fontSize: 16),
                    )
                  ]),
                )),
          );
  }
}
