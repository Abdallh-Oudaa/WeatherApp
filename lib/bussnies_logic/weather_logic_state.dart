part of 'weather_logic_cubit.dart';

@immutable
sealed class WeatherState {}

final class WeatherLogicInitial extends WeatherState {
  String message;
  WeatherLogicInitial(this.message);
}
final class WeatherLoading extends WeatherState{

}
final class WeatherLoaded extends WeatherState{
  WeatherModel? weatherModel;
  WeatherLoaded(this.weatherModel);
}
final class WeatherError extends WeatherState{
   String message;
  WeatherError(this.message);
}