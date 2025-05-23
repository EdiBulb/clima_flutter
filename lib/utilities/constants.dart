import 'package:flutter/material.dart';

const kTempTextStyle = TextStyle(fontFamily: 'Spartan MB', fontSize: 100.0);

const kMessageTextStyle = TextStyle(fontFamily: 'Spartan MB', fontSize: 60.0);

const kButtonTextStyle = TextStyle(fontSize: 30.0, fontFamily: 'Spartan MB');

const kConditionTextStyle = TextStyle(fontSize: 100.0);

// 스타일을 상수화
const kTextFieldInputDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  labelText: 'Change the city',
  // floatingLabelBehavior: FloatingLabelBehavior.always,
  // labelStyle: TextStyle(color: Colors.red),
  icon: Icon(Icons.location_city),
  hintText: 'Enter City Name',
  hintStyle: TextStyle(color: Colors.grey),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blue, width: 2.0),
  )
);
