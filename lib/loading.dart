import 'dart:developer';

import 'package:bnp_app/constants/app_constants.dart';
import 'package:bnp_app/features/home/presentation/home_screen.dart';
import 'package:bnp_app/helpers/di.dart';
import 'package:bnp_app/helpers/helpers_method.dart';
import 'package:bnp_app/networks/dio/dio.dart';
import 'package:bnp_app/splash_screen.dart';
import 'package:flutter/material.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  void initState() {
    loadInitialData();
    super.initState();
  }

  bool _isLoading = true;

  loadInitialData() async {
    await setInitValue();

    // getNoticeRx.getNotice();

    bool data = appData.read(kKeyIsLoggedIn) ?? false;
    // log("Decice ID======> ${appData.read(kKeyDeviceID)}");
    if (data) {
      String token = appData.read(kKeyAccessToken);
      // log("Token is ===========> $token");
      log("FCM Token is ===========> ${appData.read(kKeyFCMToken)}");
      DioSingleton.instance.update(token);

      // if (appData.read(kKeyRole) == 'customer') {
      // } else {
      //   getShopHomeRx.getShopHome();
      //   getRecentOrderRx.getRecentOrder();
      // }
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const SplashScreen();
    } else {
      // return Container();
      // Need to place screen later...
      // return appData.read(kKeyIsFirstTime)
      // return const QuranScreen();

      // return appData.read(kKeyIsLoggedIn)
      //     ? BottomNavScreen()
      //    // : const LoginScreen();
      //  : const OnboradingScreen();
      return HomeScreen();
      // appData.read(kKeyIsLoggedIn)
      //     ? const HomeScreen()
      //     : const LoginScreen();
      //  return LoginScreen();
    }
  }
}
