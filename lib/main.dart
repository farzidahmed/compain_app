import 'dart:developer';
import 'dart:io';

import 'package:auto_animated/auto_animated.dart';
import 'package:bnp_app/constants/app_constants.dart';
import 'package:bnp_app/constants/color.dart';
import 'package:bnp_app/helpers/language.dart';
import 'package:bnp_app/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

import 'constants/custome_theme.dart';
import 'helpers/all_routes.dart';
import 'helpers/di.dart';
import 'helpers/helpers_method.dart';
import 'helpers/navigation_service.dart';
import 'helpers/register_provider.dart';
import 'networks/dio/dio.dart';

// Future<void> backgroundHandler(RemoteMessage message) async {}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  await GetStorage.init();
  // LocationService.requestPermissions();
  diSetUp();

  // FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  // NotificationService().initNotification();

  // initInternetChecker();
  DioSingleton.instance.create();
  try {
    if (Platform.isIOS) {
      // Check if running on a simulator
      if (Platform.environment.containsKey('SIMULATOR_DEVICE_NAME')) {
        log('Running on an iOS simulator. Skipping high refresh rate setting.');
        return;
      }
    }

    // Set high refresh rate for supported devices
    await FlutterDisplayMode.setHighRefreshRate();
    log('High refresh rate mode set successfully.');
  } catch (e) {
    log('Error setting high refresh rate: $e');
  }

  runApp(const MyApp());
  // runApp(
  //   DevicePreview(
  //     enabled: !kReleaseMode,
  //     builder: ((context)=> const MyApp()))
  // );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    rotation();
    setInitValue();
    return MultiProvider(
      providers: providers,
      child: AnimateIfVisibleWrapper(
        showItemInterval: const Duration(milliseconds: 150),
        child: PopScope(
          canPop: false,
          onPopInvokedWithResult: (bool didPop, dynamic result) async {
            // showMaterialDialog(context);
          },
          child: LayoutBuilder(
            builder: (context, constraints) {
              return  UtillScreenMobile();
            },
          ),
        ),
      ),
    );
  }
}

class UtillScreenMobile extends StatelessWidget {
   UtillScreenMobile({super.key});
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
        final langCode = box.read(kKeyLanguage) ?? 'en';

    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Priche',
          theme: ThemeData(
            primarySwatch: CustomTheme.kToDark,
            primaryColor: AppColor.primaryCOlor,
            useMaterial3: false,
            appBarTheme: const AppBarTheme(
              backgroundColor: AppColor.scaffoldColor,
              elevation: 0,
              foregroundColor: AppColor.c000000,
            ),
            textSelectionTheme: const TextSelectionThemeData(
              cursorColor: AppColor.primaryCOlor,
            ),
            scaffoldBackgroundColor: AppColor.scaffoldColor,
          ),
           translations: LocalString(),
          locale: Locale(langCode),
          fallbackLocale: const Locale('en'),
          builder: (context, widget) {
            return MediaQuery(data: MediaQuery.of(context), child: widget!);
          },
          navigatorKey: NavigationService.navigatorKey,
          onGenerateRoute: RouteGenerator.generateRoute,
          home: const Loading(),

        );
      },
    );
  }
}
