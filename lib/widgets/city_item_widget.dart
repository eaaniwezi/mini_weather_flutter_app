// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_weather_app/blocs/weather/weather_bloc.dart';
import 'package:mini_weather_app/models/city_model.dart';

class CityItemWidget extends StatelessWidget {
  const CityItemWidget({
    Key? key,
    required this.cityModel,
  }) : super(key: key);

  final CityModel cityModel;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: InkWell(
          onTap: () {
            BlocProvider.of<WeatherBloc>(context).add(FindWeatherEvent(
                latitude: cityModel.latitude, longitude: cityModel.longitude));
          },
          child: Text(
            cityModel.name,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
