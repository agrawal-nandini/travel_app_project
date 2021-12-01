import 'package:flutter/material.dart';

const kTempTextStyle = TextStyle(
  fontFamily: 'Outfit',
  fontSize: 80.0,
  color: Colors.white,
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'Spartan-Variable',
  fontWeight: FontWeight.w400,
  fontSize: 25.0,
  color: Colors.white,
);

const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
  fontFamily: 'Spartan B',
  color: Colors.white,
);

const kConditionTextStyle = TextStyle(
  fontSize: 60.0,
);

const kHumidityStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 20.0,
  color: Colors.white,
);

const kTextFieldDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  icon: Icon(
    Icons.location_city,
    color: Colors.white,
  ),
  hintText: 'Enter City Name',
  hintStyle: TextStyle(
    color: Colors.grey,
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(10.0),
    ),
    borderSide: BorderSide.none,
  ),
);
