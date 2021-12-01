import 'package:flutter/material.dart';

const Color kPrimaryColor = Color(0XFF1f2870);
const Color kSecondaryColor = Color(0XFFbbbbd4);
const Color kTertiaryColor = Color(0XFF5f6ae4);
const Color kBackgroundGrey = Color(0XFFf9f9f9);

const localityList = [
  HomeCity(location: 'New York', country: 'USA', image: 'images/new_york.jpeg'),
  HomeCity(location: 'London', country: 'UK', image: 'images/london.jpeg'),
  HomeCity(location: 'Paris', country: 'France', image: 'images/paris.jpeg'),
  HomeCity(location: 'Tokyo', country: 'Japan', image: 'images/tokyo.jpeg'),
  HomeCity(
      location: 'Barcelona', country: 'Spain', image: 'images/barcelona.jpeg'),
];

class HomeCity {
  final String location;
  final String country;
  final String image;

  const HomeCity(
      {required this.location, required this.country, required this.image});
}
