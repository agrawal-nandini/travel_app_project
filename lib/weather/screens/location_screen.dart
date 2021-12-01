import 'package:flutter/material.dart';
import 'package:travel_app/weather/utilities/constants.dart';
import 'package:travel_app/weather/services/weather.dart';

class LocationScreen extends StatefulWidget {
  final cityName;
  LocationScreen({this.cityName});
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  int temperature = 0;
  String weatherIcon = '';
  String weatherMessage = '';

  WeatherModel weather = WeatherModel();

  @override
  void initState() {
    super.initState();
    updateUI(widget.cityName);
  }

  void updateUI(String cityName) async {
    var weatherData = await weather.getCityWeather(cityName);
    setState(() {
      if (weatherData == null) {
        temperature = 0;
        weatherIcon = 'Error';
        weatherMessage = 'Unable to get weather data';
        return;
      }
      double temp = weatherData['main']['temp'];
      temperature = temp.toInt();
      var condition = weatherData['weather'][0]['id'];
      weatherIcon = weather.getWeatherIcon(condition);
      weatherMessage = weather.getMessage(temperature);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WEATHER'),
        backgroundColor: Color(0x80FF4F79),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'images/weather_images/${widget.cityName}_weather.jpg'),
            fit: BoxFit.fill,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Container(
            //color: Color(0x80d8e2dc),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.0, right: 10.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0x80FF828A),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          topRight: Radius.circular(10.0),
                        ),
                      ),
                      child: Row(
                        children: <Widget>[
                          Text(
                            weatherIcon,
                            style: kConditionTextStyle,
                          ),
                          Text(
                            '$temperature°',
                            style: kTempTextStyle,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 10.0, bottom: 1.0, right: 10.0),
                  child: Container(
                    color: Color(0x80FF828A),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        "$weatherMessage in ${widget.cityName}!",
                        textAlign: TextAlign.left,
                        style: kMessageTextStyle,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
