// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mini_weather_app/models/city_model.dart';
import 'package:mini_weather_app/widgets/city_item_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: cityList.length,
        itemBuilder: ((context, index) {
          var cityModel = cityList[index];
          return CityItemWidget(cityModel: cityModel);
        }),
      ),
    );
  }
}
