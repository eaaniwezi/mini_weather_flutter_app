// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_weather_app/models/city_model.dart';
import 'package:mini_weather_app/repositories/show_toast.dart';
import 'package:mini_weather_app/widgets/city_item_widget.dart';
import 'package:mini_weather_app/widgets/loading_data_widget.dart';
import 'package:mini_weather_app/blocs/weather/weather_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<WeatherBloc, WeatherState>(
      listener: (context, state) {
        if (state is ErrorFetchingData) {
          ShowToast().showToast(msg: "Ошибка выборки данных", isErrorMsg: true);
        }
      },
      child: Scaffold(
        body: Stack(
          children: [
            ListView.builder(
              itemCount: cityList.length,
              itemBuilder: ((context, index) {
                var cityModel = cityList[index];
                return CityItemWidget(cityModel: cityModel);
              }),
            ),
            LoadingDataWidget(),
          ],
        ),
      ),
    );
  }
}
