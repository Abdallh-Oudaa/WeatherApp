import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bussnies_logic/weather_logic_cubit.dart';
import 'package:weather_app/data/repositry/repository.dart';
import 'package:weather_app/data/web_service/web_service.dart';
import 'package:weather_app/presentation/screens/weather_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => WeatherLogicCubit(RepositoryWeather(WeatherService())),
        child:const WeatherScreen(),
      ),
    );
  }
}
