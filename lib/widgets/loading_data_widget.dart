
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_weather_app/blocs/weather/weather_bloc.dart';

class LoadingDataWidget extends StatelessWidget {
  const LoadingDataWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        if (state is FetchingData) {
          return Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.black54,
            child: Center(
              child: CircularProgressIndicator(color: Colors.green),
            ),
          );
        }
        return Container();
      },
    );
  }
}
