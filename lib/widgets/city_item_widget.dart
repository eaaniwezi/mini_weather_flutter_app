// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(""),
              Text(
                cityModel.name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Загрузка...",
                style: TextStyle(color: Colors.green, fontSize: 10),
              )
            ],
          )),
    );
  }
}
