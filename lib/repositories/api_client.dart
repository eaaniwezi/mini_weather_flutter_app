import 'package:dio/dio.dart';
import 'package:mini_weather_app/models/weather_model.dart';
import 'package:retrofit/retrofit.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: "https://fcc-weather-api.glitch.me/api/")
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET("/current")
  Future<WeatherModel> fetchWeatherData(
      @Query("lat") double lat, @Query("lon") double lon);
}
