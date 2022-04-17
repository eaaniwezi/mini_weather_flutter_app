// ignore_for_file: prefer_const_constructors, avoid_print, unnecessary_null_comparison

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mini_weather_app/models/weather_model.dart';
import 'package:mini_weather_app/repositories/weather_repository.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;

  WeatherBloc({
    required WeatherState initialState,
    required this.weatherRepository,
  })  : assert(weatherRepository != null),
        super(initialState) {
    add(StartEvent());
  }

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
    if (event is FindWeatherEvent) {
      try {
        yield FetchingData();
        late final WeatherModel _weatherModel;
        _weatherModel = await weatherRepository.getWeather(
            latitude: event.latitude, longitude: event.longitude);
        yield SuccessullyFetchedData(weatherModel: _weatherModel);
      } catch (e) {
        yield ErrorFetchingData(error: "Couldn't fetch data");
      }
    }
  }
}
