import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/data/web_service/web_service.dart';
import 'package:weather_app/presentation/widgets/custom_weater_city.dart';

import '../../bussnies_logic/weather_logic_cubit.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  TextEditingController cityName = TextEditingController();
  WeatherService? webService;
  String? name;
  bool checkWeather = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: checkWeather ? Colors.orange : Colors.white,
        appBar: AppBar(
          backgroundColor:checkWeather?Colors.orange:Colors.indigo,
          title: const Text(
            "weather app",
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.w400),
          ),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: cityName,
                        decoration: InputDecoration(
                          hintText: "type here to search ",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5)),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    ElevatedButton.icon(
                        onPressed: () {
                          name = cityName.text.toString();
                          context
                              .read<WeatherLogicCubit>()
                              .getLocationWeather(name!.trim());
                          checkWeather = true;
                          setState(() {});
                        },
                        label: const Icon(
                          Icons.search,
                          color: Colors.blue,
                        )),
                  ],
                ),
                SizedBox(
                  height: 300,
                  width: 400,
                  child: BlocBuilder<WeatherLogicCubit, WeatherState>(
                    builder: (context, state) {
                      if (state is WeatherLoaded) {
                        var weatherModel = state.weatherModel;
                        return CustomWeatherCity(weatherModel: weatherModel!);
                      } else if (state is WeatherError) {
                        String error = state.message;
                        return Center(
                          child: Container(

                            child: Text(
                              error,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        );
                      }
                      else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
