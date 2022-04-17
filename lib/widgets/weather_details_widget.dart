// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:mini_weather_app/models/weather_model.dart';

class LandscapeView extends StatelessWidget {
  final WeatherModel weatherModel;
  final String cityName;
  const LandscapeView({
    Key? key,
    required this.weatherModel,
    required this.cityName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.network(
          weatherModel.weather![0].icon.toString(),
          height: 123,
          width: 123,
          fit: BoxFit.contain,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                cityName,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 30,
                ),
              ),
            ),
            Text(
              weatherModel.main!.temp.toString() + "°",
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 70,
              ),
            ),
          ],
        )
      ],
    );
  }
}

class ProtraitView extends StatelessWidget {
  final WeatherModel weatherModel;
  final String cityName;
  const ProtraitView({
    Key? key,
    required this.weatherModel,
    required this.cityName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.network(
          weatherModel.weather![0].icon.toString(),
          height: 123,
          width: 123,
          fit: BoxFit.contain,
        ),
        Center(
          child: Text(
            cityName,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 30,
            ),
          ),
        ),
        Text(
          weatherModel.main!.temp.toString() + "°",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 70,
          ),
        ),
      ],
    );
  }
}
