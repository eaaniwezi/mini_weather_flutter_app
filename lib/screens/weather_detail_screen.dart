// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:mini_weather_app/blocs/weather/weather_bloc.dart';

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
          return Text("");
        },
      ),
    );
  }
}
