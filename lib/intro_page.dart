import 'package:flutter/material.dart';
import 'database.dart';
import 'constants.dart';
import 'intro_image.dart';
import 'bottom_botton_design.dart';
import 'package:travel_app/maps/google_maps.dart';
import 'package:travel_app/weather/screens/location_screen.dart';
import 'money/currency_converter.dart';

class IntroPage extends StatelessWidget {
  Cities city = Cities();
  int index;

  IntroPage({required this.index});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFF7FFF7),
        //backgroundColor: Color(0xFFF7FFF7),
        // appBar: AppBar(
        //   title: const Text('Travel App'),
        // ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IntroImage(
              city: city,
              index: index,
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 6.0),
                child: Center(
                  child: Text(
                    city.cities[index].brief,
                    textAlign: TextAlign.center,
                    style: kIntroBriefStyle,
                  ),
                ),
              ),
              flex: 5,
            ),
            BottomButton(
              buttonColor: Color(0x80657ED4),
              textColor: Colors.black,
              iconData: Icons.description_outlined,
              buttonText: 'FAMOUS PLACES',
              ontap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => GoogleMapsScreen(index)));
              },
            ),
            SizedBox(
              height: 4.0,
            ),
            BottomButton(
              buttonColor: Color(0x80FF4F79),
              textColor: Colors.black,
              iconData: Icons.wb_sunny_outlined,
              buttonText: 'WEATHER',
              ontap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return LocationScreen(
                    cityName: city.cities[index].name,
                  );
                }));
              },
            ),
            SizedBox(
              height: 4.0,
            ),
            BottomButton(
              buttonColor: Color(0x80D03386),
              textColor: Colors.black,
              iconData: Icons.money_outlined,
              buttonText: 'CURRENCY CONVERTER',
              ontap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return CurrencyConverter(index);
                }));
              },
            ),
            SizedBox(
              height: 4.0,
            ),
          ],
        ),
      ),
    );
  }
}
