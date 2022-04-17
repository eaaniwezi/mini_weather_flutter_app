// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mini_weather_app/models/city_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: cityList.length,
        itemBuilder: ((context, index) {
          var cityModel = cityList[index];
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                cityModel.name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
