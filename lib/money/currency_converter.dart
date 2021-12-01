import 'package:flutter/material.dart';
import 'package:travel_app/weather/services/networking.dart';
import 'package:travel_app/money/currency_name.dart';
import 'package:travel_app/constants.dart';
import 'package:flutter/services.dart';

const api_key = 'abf010dd1a61a8d859612d35';

class CurrencyConverter extends StatefulWidget {
  int index;
  CurrencyConverter(this.index);
  @override
  _CurrencyConverterState createState() => _CurrencyConverterState(index);
}

class _CurrencyConverterState extends State<CurrencyConverter> {
  bool isINR = false;
  int index;
  _CurrencyConverterState(this.index);
  String fromTextController = '';
  currency currencies = currency();
  String fromCurrency = "INR";
  String toCurrency = "INR";
  String result = '';
  String from_currency_name = "Indian Rupee";
  String to_currency_name = "Indian Rupee";
  final textfield = TextEditingController();
  void cleartext() {
    textfield.clear();
  }

  Future<String> do_Conversion() async {
    NetworkHelper networkHelper = NetworkHelper(
        'https://v6.exchangerate-api.com/v6/$api_key/latest/$fromCurrency');
    double inputVal = double.parse(fromTextController);
    var responseBody = await networkHelper.getData();
    result = (inputVal * (responseBody['conversion_rates'][toCurrency]))
        .toStringAsFixed(2);
    print(result);
    return "Success";
  }

  @override
  Widget build(BuildContext context) {
    if (isINR) {
      fromCurrency = 'INR';
      toCurrency = currencies.currencylist[index].shortname;
      from_currency_name = "Indian Rupee";
      to_currency_name = currencies.currencylist[index].name;
    } else {
      fromCurrency = currencies.currencylist[index].shortname;
      toCurrency = 'INR';
      from_currency_name = currencies.currencylist[index].name;
      to_currency_name = "Indian Rupee";
    }
    print(isINR);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Currency Converter"),
        backgroundColor: Color(0x80D03386),
      ),
      body: Container(
        //color: Color(0x80FFB49A),
        color: Color(0x80D03386),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 150,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('images/Currency.png'),
                ),
              ),
            ),
            // const SizedBox(
            //   height: 80.0,
            // ),
            Expanded(
              flex: 5,
              child: Card(
                color: Color(0xFFF7FFF7),
                elevation: 3.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Container(
                        height: 70.0,
                        child: TextField(
                          inputFormatters: [
                            FilteringTextInputFormatter.deny(' '),
                            FilteringTextInputFormatter.deny(','),
                          ],
                          decoration: kTextFieldDecoration,
                          textAlign: TextAlign.center,
                          onChanged: (value) {
                            fromTextController = value;
                            if (double.parse(value) < 0) {
                              setState(() {
                                result = '';
                                value = '0';
                                textfield.clear();
                              });
                            }
                            // do_Conversion();
                          },
                          controller: textfield,
                          style: TextStyle(fontSize: 20.0, color: Colors.black),
                          keyboardType:
                              TextInputType.numberWithOptions(decimal: true),
                        ),
                      ),
                    ),
                    Text(
                      from_currency_name,
                      style: kIntroButtonText,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                do_Conversion();
                              });
                            },
                            child: const Icon(
                              Icons.arrow_circle_down,
                              size: 80.0,
                              color: Color(0xFF657ED4),
                            ),
                          ),
                        ]),
                    Text(
                      to_currency_name,
                      style: kIntroButtonText,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Container(
                        width: double.infinity,
                        height: 70.0,
                        color: Color(0x70D03386),
                        child: Center(
                          child: result != null
                              ? Text(
                                  result,
                                  style: kIntroButtonText,
                                )
                              : Text(""),
                        ),
                      ),
                    ),
                    // Text(
                    //   to_currency_name,
                    //   style: kIntroButtonText,
                    // ),
                  ],
                ),
              ),
            ),
            // SizedBox(
            //   height: 100.0,
            //   child: Container(),
            // ),
            Expanded(
              child: Container(
                width: double.infinity,
                color: Color(0x80657ED4),
                child: GestureDetector(
                  onTap: () {
                    setState(
                      () {
                        isINR = !isINR;
                        cleartext();
                        result = '';
                      },
                    );
                  },
                  child: Center(
                    child: Text(
                      'REVERSE',
                      style: TextStyle(
                        fontFamily: 'Outfit',
                        fontSize: 35.0,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
