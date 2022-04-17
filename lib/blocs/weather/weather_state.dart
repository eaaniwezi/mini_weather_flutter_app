part of 'weather_bloc.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

class WeatherInitial extends WeatherState {}

class FetchingData extends WeatherState {}

class SuccessullyFetchedData extends WeatherState {
  final WeatherModel weatherModel;
  const SuccessullyFetchedData({
    required this.weatherModel,
  });
}

class ErrorFetchingData extends WeatherState {
  final String error;
  const ErrorFetchingData({
    required this.error,
  });
}
