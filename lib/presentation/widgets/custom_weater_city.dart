import 'package:flutter/material.dart';
import 'package:weather_app/data/model/weather_model.dart';

class CustomWeatherCity extends StatelessWidget {
  final WeatherModel weatherModel;
  const CustomWeatherCity({required this.weatherModel, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 50,),
      child: Column(
        children: [
          Center(
              child: Text(
            "${weatherModel.country}",
            style: const TextStyle(
                color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
          )),
          Center(
              child: Text(
            "${weatherModel.state}",
            style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w400),
          )),
          Text("Lat:${weatherModel.lat}",style: const TextStyle(color: Colors.black,fontSize: 20),),
          Text("Lon:${weatherModel.lon}",style: const TextStyle(color: Colors.black,fontSize: 20),),



        ],
      ),
    );
  }
}
