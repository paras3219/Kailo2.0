import 'package:flutter/material.dart';

InputDecoration ktextFieldDecoration(String hintText) {
  return InputDecoration(
      focusedBorder:
          OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.black54,
        ),
      ),
      hintText: hintText,
      hintStyle: TextStyle(color: Colors.black54));
}

TextStyle ktextStyle() {
  return TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold);
}
List<double> scoreValues = [-1,-1,-1,-1,-1,-1,-1,-1,-1,-1];
enum Gender {
  male,
  female,
}
enum userSettingsOrHealth {
  profile,
  health,
}
