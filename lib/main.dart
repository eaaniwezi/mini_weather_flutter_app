// ignore_for_file: prefer_const_constructors

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_weather_app/screens/home_screen.dart';
import 'package:mini_weather_app/screens/initial_screen.dart';
import 'package:mini_weather_app/repositories/show_toast.dart';
import 'package:mini_weather_app/screens/no_internet_screen.dart';
import 'package:mini_weather_app/blocs/network/network_bloc.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<NetworkBloc>(
        create: (context) {
          return NetworkBloc()..add(ListenConnection());
        },
      ),
    ],
    child: BlocListener<NetworkBloc, NetworkState>(
      listener: (context, state) {
        if (state is ConnectionFailure) {
          ShowToast()
              .showToast(msg: "Проверьте свой Интернет", isErrorMsg: true);
        }
      },
      child: MyApp(),
    ),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Mini Weather App",
      home: BlocBuilder<NetworkBloc, NetworkState>(
        builder: (context, state) {
          if (state is ConnectionFailure) {
            return NoInternetScreen();
          }
          if (state is ConnectionSuccess) {
            return HomeScreen();
          }
          return InitialScreen();
        },
      ),
    );
  }
}
