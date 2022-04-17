import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:mini_weather_app/models/weather_model.dart';
import 'package:mini_weather_app/repositories/api_client.dart';

class WeatherRepository {
  var dioRequest = Dio();

  // var logger = Logger();

  Future<WeatherModel> getWeather(
      {required double latitude, required double longitude}) async {
    final weatherResult = await ApiClient(dioRequest)
        .fetchWeatherData(latitude, longitude)
        .catchError((obj) {
      switch (obj.runtimeType) {
        case DioError:
          // final res = (obj as DioError).response;
          // logger.e("Got error : ${res!.statusCode} -> ${res.statusMessage}");
          break;
        default:
          break;
      }
    });
    return weatherResult;
  }
}
