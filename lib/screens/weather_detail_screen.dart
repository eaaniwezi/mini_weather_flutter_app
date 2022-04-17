// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:mini_weather_app/blocs/weather/weather_bloc.dart';
import 'package:mini_weather_app/models/weather_model.dart';
import 'package:mini_weather_app/widgets/weather_details_widget.dart';

class WeatherDetailScreen extends StatelessWidget {
  final String cityName;
  const WeatherDetailScreen({
    Key? key,
    required this.cityName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
            onPressed: (() {
              Get.back();
            }),
            icon: Icon(Icons.arrow_back, color: Colors.black)),
      ),
      body: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
          if (state is SuccessullyFetchedData) {
            var weatherModel = state.weatherModel;
            return OrientationBuilder(
              builder: (context, orientation) {
                if (orientation == Orientation.portrait) {
                  return ProtraitView(
                      weatherModel: weatherModel, cityName: cityName);
                } else {
                  return LandscapeView(
                      weatherModel: weatherModel, cityName: cityName);
                }
              },
            );
          }
          return Text("");
        },
      ),
    );
  }
}
