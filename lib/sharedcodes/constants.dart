import 'package:flutter/material.dart';

const textInputDecoration = InputDecoration(
  hintText: 'Password',
  fillColor: Colors.white,
  filled: true,
  hintStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.white24),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.pink, width: 2),
  ),
  enabledBorder:
      OutlineInputBorder(borderSide: BorderSide(color: Colors.white, width: 2)),
);
