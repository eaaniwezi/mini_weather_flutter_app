// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_weather_app/bloc/network_bloc.dart';
import 'package:mini_weather_app/repositories/show_toast.dart';
import 'package:mini_weather_app/screens/no_internet_screen.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<NetworkBloc, NetworkState>(
      listener: (context, state) {
        if (state is ConnectionFailure) {
          ShowToast()
              .showToast(msg: "Проверьте свой Интернет", isErrorMsg: true);
          Get.to(() => NoInternetScreen());
        }
        if (state is ConnectionSuccess) {
          ShowToast().showToast(
              msg: "Хорошее Подключение К Интернету", isErrorMsg: false);
        }
      },
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "icons/home.jpg",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  "Welcome.......",
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
