import 'package:weather_app/data/model/weather_model.dart';

import '../web_service/web_service.dart';

class RepositoryWeather {
  WeatherService? weatherService;
  RepositoryWeather(this.weatherService);
  Future<WeatherModel?> getLocationWeather(String cityName) async {
    try {
      var data = await weatherService?.getLocationWeather(cityName);
      if (data != null) {
        return data;
      } else {
        return null;
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }
}
