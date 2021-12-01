import 'package:flutter/material.dart';
import 'constants1.dart';
import 'intro_page.dart';

class LocationSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.1),
            child: Row(
              children: <Widget>[
                Text(
                  'Popular Places',
                  style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.black,
                      fontFamily: 'Outfit',
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.05,
              right: MediaQuery.of(context).size.width * 0.25,
              bottom: MediaQuery.of(context).size.height * 0.02,
            ),
          ),
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.05),
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: EdgeInsets.only(
                            right: MediaQuery.of(context).size.width * 0.02),
                        child: TextButton(
                          onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      IntroPage(index: index))),
                          child: Container(
                            width: MediaQuery.of(context).size.width / 2,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image:
                                        AssetImage(localityList[index].image),
                                    fit: BoxFit.fill),
                                borderRadius: BorderRadius.circular(20.0)),
                            child: Padding(
                              padding: EdgeInsets.all(
                                  (MediaQuery.of(context).size.width / 2) *
                                      0.1),
                              child: Stack(
                                children: <Widget>[
                                  Align(
                                      alignment: Alignment.topLeft,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Padding(
                                            padding: EdgeInsets.all(5.0),
                                            child: Text(
                                              localityList[index].location,
                                              style: TextStyle(
                                                  color: Color(0xFFF7FFF7),
                                                  fontFamily: 'AnticSlab',
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20.0),
                                            ),
                                          ),
                                          Row(
                                            children: <Widget>[
                                              Icon(
                                                Icons.location_on,
                                                color: Color(0xFFFBB5B1),
                                              ),
                                              Text(
                                                localityList[index].country,
                                                style: TextStyle(
                                                    color: Color(0xFFF7FFF7),
                                                    fontFamily:
                                                        'Spartan-Variable',
                                                    fontSize: 20.0),
                                              ),
                                            ],
                                          ),
                                        ],
                                      )),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
