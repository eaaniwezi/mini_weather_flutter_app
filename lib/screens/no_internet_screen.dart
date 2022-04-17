// ignore_for_file: prefer_const_constructors

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_weather_app/bloc/network_bloc.dart';
import 'package:mini_weather_app/screens/home_screen.dart';
import 'package:mini_weather_app/repositories/show_toast.dart';

class NoInternetScreen extends StatelessWidget {
  const NoInternetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<NetworkBloc, NetworkState>(
      listener: (context, state) {
        if (state is ConnectionFailure) {
          ShowToast()
              .showToast(msg: "Проверьте свой Интернет", isErrorMsg: true);
        }
        if (state is ConnectionSuccess) {
          ShowToast().showToast(
              msg: "Хорошее Подключение К Интернету", isErrorMsg: false);
          Get.to(() => HomeScreen());
        }
      },
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.15,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: AssetImage(
                    "icons/error.png",
                  ),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Проверьте свой Интернет',
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
