import 'package:flutter/material.dart';
import 'constants.dart';

class BottomButton extends StatelessWidget {
  final IconData iconData;
  final String buttonText;
  final Color textColor;
  final Function ontap;
  final Color buttonColor;

  BottomButton(
      {required this.iconData,
      required this.buttonText,
      required this.textColor,
      required this.ontap,
      required this.buttonColor});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () => ontap(),
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: buttonColor,
                ),
                margin: EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        child: Icon(
                          iconData,
                          color: textColor,
                          size: 30.0,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            buttonText,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 26.0,
                              fontWeight: FontWeight.w500,
                              color: textColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      flex: 2,
    );
  }
}
