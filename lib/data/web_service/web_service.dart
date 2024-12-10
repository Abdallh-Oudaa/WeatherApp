import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/data/model/weather_model.dart';

/*class WeatherService {
  final String _baseUrl = "api.openweathermap.org";
  final String _apiKey = "dd6806e7af324ac79819a29e8840366b";
  final String _endPoint = "/geo/1.0/direct";
  Future<WeatherModel?> getLocationWeather(String cityName) async {
    Uri uri = Uri.https(
        _baseUrl, _endPoint, {"appid": _apiKey, "q": cityName, "limit": 1});

    try {
      var response = await http.get(uri);
      if (response.statusCode==200) {
        var json = jsonDecode(response.body);


          print(json[0]);

          return WeatherModel.fromJson(json[0]);

      } else {
        print("error${response.statusCode}");
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }
}*/
class WeatherService {
  final String _baseUrl = "api.openweathermap.org";
  final String _apiKey = "dd6806e7af324ac79819a29e8840366b";
  final String _endPoint = "/geo/1.0/direct";

  Future<WeatherModel?> getLocationWeather(String cityName) async {
    // Build the URI
    Uri uri = Uri.https(
      _baseUrl,
      _endPoint,
      {"appid": _apiKey, "q": cityName, "limit": "1"},
    );

    try {
      var response = await http.get(uri);
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);

        if (json is List && json.isNotEmpty) {
          print(json[0]);
           return WeatherModel.fromJson(json[0]);
        } else {
          print("No data found for the provided city.");
        }
      } else {
        print("Error: ${response.statusCode} - ${response.reasonPhrase}");
      }
    } catch (e) {
      print("Exception: $e");
    }
    return null;
  }
}

