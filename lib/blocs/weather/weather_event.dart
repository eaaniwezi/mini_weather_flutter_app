part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object> get props => [];
}

class StartEvent extends WeatherEvent {}

class FindWeatherEvent extends WeatherEvent {
  final double latitude;
  final double longitude;
  const FindWeatherEvent({
    required this.latitude,
    required this.longitude,
  });
}
