import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:weather_app/data/my_location.dart';
import 'package:weather_app/data/network.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:weather_app/screens/weather_screen.dart';

class LoadingScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoadingState();
}

class _LoadingState extends State<LoadingScreen> {
  late double latitude2;
  late double longitude2;

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    final String apiKey = dotenv.get('API_KEY');
    MyLocation myLocation = MyLocation();
    await myLocation.getCurrentLocation();
    latitude2 = myLocation.latitude;
    longitude2 = myLocation.longitude;

    Network network = Network(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude2&lon=$longitude2&appid=$apiKey&units=metric',
    'https://api.openweathermap.org/data/2.5/air_pollution?lat=$latitude2&lon=$longitude2&appid=$apiKey');

    var weatherData = await network.getJsonData();
    var airData = await network.getAirData();
    print(airData);

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return WeatherScreen(parseWeatherData: weatherData, parseAirPollution: airData);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.amber,
      body: Center(
        child: LoadingIndicator(
          indicatorType: Indicator.ballClipRotate,
          colors: [Colors.redAccent],
          strokeWidth: 2,
        ),
      ),
    );
  }
}