import 'package:flutter/material.dart';
import 'header_travel.dart';
import 'search.dart';
import 'location_slider.dart';
import 'bottom_app_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: IntroPage(
      //   index: 12,
      // ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            HeaderTravelUI(),
            SizedBox(
              height: 20.0,
            ),
            SearchSection(),
            SizedBox(
              height: 20.0,
            ),
            LocationSlider(),
            SizedBox(
              height: 10.0,
            ),
            bottomappbar(),
          ],
        ),
      ),
    );
  }
}
