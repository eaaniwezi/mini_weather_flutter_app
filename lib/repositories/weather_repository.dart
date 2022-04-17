import 'package:dio/dio.dart';
import 'package:mini_weather_app/models/weather_model.dart';
import 'package:mini_weather_app/repositories/api_client.dart';

class WeatherRepository {
  var dioRequest = Dio();

  Future<WeatherModel> getWeather(
      {required double latitude, required double longitude}) async {
    final weatherResult =
        await ApiClient(dioRequest).fetchWeatherData(latitude, longitude);
    return weatherResult;
  }
}
