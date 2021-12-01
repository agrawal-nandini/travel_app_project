import 'package:flutter/material.dart';
import 'database.dart';
import 'constants.dart';

class IntroImage extends StatelessWidget {
  IntroImage({
    required this.city,
    required this.index,
  });

  final Cities city;
  int index;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 4.0,
            bottom: 2.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                city.cities[index].name,
                style: kIntroTitleStyle,
              ),
              const Text(
                ', ',
                style: kIntroTitleStyle,
              ),
              Text(
                city.cities[index].country,
                style: kIntroTitleStyle,
              ),
            ],
          ),
        ),
        margin: EdgeInsets.all(4.0),
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'images/${city.cities[index].landscapePic}',
              ),
              fit: BoxFit.cover,
            ),
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.all(
              Radius.circular(8.0),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.blueGrey,
                offset: Offset.fromDirection(2.0),
              )
            ]),
      ),
      flex: 10,
    );
  }
}
