import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

const kIntroTitleStyle =
    TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold, color: Colors.white);

const kIntroBriefStyle = TextStyle(
  fontSize: 16.0,
  fontFamily: 'Spartan-Variable',
);

const kIntroButtonText = TextStyle(
  fontSize: 22.0,
  fontWeight: FontWeight.w400,
  fontFamily: 'Spartan-Variable',
);

const kIntroButtonSmallText = TextStyle(
  fontWeight: FontWeight.w400,
  fontSize: 14.0,
);
const kTextFieldDecoration = InputDecoration(
  filled: true,
  fillColor: Color(0x80D03386),
  // icon: Icon(
  //   Icons.location_city,
  //   color: Colors.white,
  // ),
  hintText: 'Enter Amount',
  hintStyle: TextStyle(
    color: Colors.grey,
  ),
  border: OutlineInputBorder(
    borderSide: BorderSide.none,
    borderRadius: BorderRadius.all(Radius.zero),
  ),
);
