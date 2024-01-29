import 'package:http/http.dart' as http;
import 'dart:convert';

class Network {
  final String temperatureUrl;
  final String airQualityUrl;
  Network(this.temperatureUrl, this.airQualityUrl);

  Future<dynamic> getJsonData() async {
    var response = await http.get(Uri.parse(temperatureUrl));
    if (response.statusCode == 200) {
      String jsonData = response.body;

      return jsonDecode(jsonData);
    }
  }

  Future<dynamic> getAirData() async {
    var response = await http.get(Uri.parse(airQualityUrl));
    if (response.statusCode == 200) {
      String jsonData = response.body;

      return jsonDecode(jsonData);
    }
  }
}