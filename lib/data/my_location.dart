import 'package:geolocator/geolocator.dart';


class MyLocation {
  late double latitude;
  late double longitude;

  Future<void> getCurrentLocation() async {
    // 데이터 통신이 안될 경우에 대한 try ~ catch
    try {
      LocationPermission permission = await Geolocator.requestPermission();
      Position position = await Geolocator.
      getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print("인터넷 연결이 되지 않음.");
    }
  }
}

