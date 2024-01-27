import 'package:flutter/material.dart';


class WeatherScreen extends StatefulWidget {
  final dynamic parseWeatherData;
  const WeatherScreen({super.key, this.parseWeatherData});

  @override
  State<StatefulWidget> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  late String cityName;
  late int temp;

  @override
  void initState() {
    super.initState();
    // widget 속성은 State객체가 Parent객체인 WeatherScreen이 가지고있는 모든 데이터에 접근 가능하게 만들어준다.
    updateData(widget.parseWeatherData);
  }

  void updateData(dynamic weatherData) {
    double temp2 = weatherData['main']['temp'];
    temp = temp2.round();
    cityName = weatherData['name'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('$cityName',
              style: TextStyle(fontSize: 30),),
              SizedBox(height: 20,),
              Text('$temp', style: TextStyle(fontSize:30),),
            ],
          ),
        ),
      ),
    );
  }
}