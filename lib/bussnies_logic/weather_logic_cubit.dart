import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:weather_app/data/model/weather_model.dart';
import 'package:weather_app/data/repositry/repository.dart';

part 'weather_logic_state.dart';

class WeatherLogicCubit extends Cubit<WeatherState> {
 final RepositoryWeather repositoryWeather;


  WeatherLogicCubit(this.repositoryWeather) : super(WeatherLogicInitial("No city to search"));
  Future<WeatherModel?> getLocationWeather(String cityName) async{
      var cityWeather=await repositoryWeather.getLocationWeather(cityName);
     emit(WeatherLoading());
     try {
       if(cityWeather==null||cityName.length!=cityWeather.name?.length){
         emit(WeatherError("the name of city is wrong"));

       }
       else{
         emit(WeatherLoaded(cityWeather));
       }
     }catch(e){
       emit(WeatherError(e.toString()));
     }
     return null;
   }
}
