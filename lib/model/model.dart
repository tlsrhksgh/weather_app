
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Model {
  Widget getWeatherIcon(int condition) {
    if (condition < 300) {
      return SvgPicture.asset(
        'svg/Cloud_lightning.svg',
        color: Colors.black87,
      );
    } else if (condition < 600) {
      return SvgPicture.asset(
        'svg/Cloud_Rain.svg',
        color: Colors.black87,
      );
    } else if (condition == 800) {
      return SvgPicture.asset(
        'svg/Sun.svg',
        color: Colors.black87,
      );
    } else if (condition <= 804) {
      return SvgPicture.asset(
        'svg/Cloud_Sun.svg',
        color: Colors.black87,
      );
    }
    throw StateError("getWeather Error");
  }

  Widget getAirIcon(int index) {
    if(index == 1) {
      return Image.asset('images/good.png', width: 37, height: 35,);
    } else if (index == 2) {
      return Image.asset('images/fair.png', width: 37, height: 35,);
    } else if (index == 3) {
      return Image.asset('images/moderate.png', width: 37, height: 35,);
    } else if (index == 4) {
      return Image.asset('images/poor.png', width: 37, height: 35,);
    } else if (index == 5) {
      return Image.asset('images/bad.png', width: 37, height: 35,);
    }

    throw StateError("getAirData Error");
  }

  Widget getAirCondition(int index) {
    if (index == 1) {
      return const Text(
        '"매우좋음"',
        style: TextStyle(
          color: Colors.indigo,
          fontWeight: FontWeight.bold,
        ),
      );
    } else if (index == 2) {
      return const Text(
        '"좋음"',
        style: TextStyle(
          color: Colors.indigo,
          fontWeight: FontWeight.bold,
        ),
      );
    } else if (index == 3) {
      return const Text(
        '"보통"',
        style: TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.bold,
        ),
      );
    } else if (index == 4) {
      return const Text(
        '"나쁨"',
        style: TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.bold,
        ),
      );
    } else if (index == 5) {
      return const Text(
        '"매우나쁨"',
        style: TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.bold,
        ),
      );
    }

    throw StateError("getAirData Error");
  }
}