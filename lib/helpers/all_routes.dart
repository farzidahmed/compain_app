// ignore_for_file: unused_element

import 'dart:io';

import 'package:bnp_app/about-us/presentation/about_us_screen.dart';
import 'package:bnp_app/features/about_app/presentation/about_app.dart';
import 'package:bnp_app/features/auth/presentation/confirm/confirm_screen.dart';
import 'package:bnp_app/features/auth/presentation/forget_password/forget_password.dart';
import 'package:bnp_app/features/auth/presentation/login/login_screen.dart';
import 'package:bnp_app/features/auth/presentation/otp_verify/otp_verify_screen.dart';
import 'package:bnp_app/features/auth/presentation/reset_password/reset_password_screen.dart';
import 'package:bnp_app/features/auth/presentation/signup/sign_up_screen.dart';
import 'package:bnp_app/features/auth/presentation/user_verify/user_verfiy_screen.dart';
import 'package:bnp_app/features/bnp_dofa/presentation/bnp_dofa_screen.dart';
import 'package:bnp_app/features/cadabaj/presentation/cadabaj_screen.dart';
import 'package:bnp_app/features/contact_us/presentation/contact_us_screen.dart';
import 'package:bnp_app/features/gallery/presentation/gallery_screen.dart';
import 'package:bnp_app/features/home/presentation/home_screen.dart';
import 'package:bnp_app/features/information/presentation/information_screen.dart';
import 'package:bnp_app/features/my_list/presentation/my_list_screen.dart';
import 'package:flutter/cupertino.dart';

final class Routes {
  static final Routes _routes = Routes._internal();
  Routes._internal();
  static Routes get instance => _routes;

  static const String navigationScreen = '/navigation_screen';

  static const String loginScreen = '/login_screen';
  static const String signupScreen = '/signup_screen';
  static const String forgetPasswordScreen = '/forgetPasswordScreen';
  static const String otpVerifyScreen = '/otpVerifyScreen';
  static const String resetPasswordScreen = '/resetPasswordScreen';
  static const String confirmScreen = '/confirmScreen';
  static const String userVerifyScreen = '/userVerifyScreen';
  static const String homeScreen = '/homeScreen';
  static const String information = '/information';
  static const String cadabaj = '/cadabaj';
  static const String bnpDofa = '/bnpDofa';
  static const String gallery = '/gallery';
  static const String contactUs = "/contactus";
  static const String myListing = "/myListing";
  static const String aboutUsScreen = "/aboutUsScreen";
  static const String aboutAppScreen = "/aboutAppScreen";
}

final class RouteGenerator {
  static final RouteGenerator _routeGenerator = RouteGenerator._internal();
  RouteGenerator._internal();
  static RouteGenerator get instance => _routeGenerator;

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case Routes.navigationScreen:
      //   return Platform.isAndroid
      //       ? _FadedTransitionRoute(
      //         widget: const NavigationScreen(),
      //         settings: settings,
      //       )
      //       : CupertinoPageRoute(
      //         builder: (context) => const NavigationScreen(),
      //       );

      case Routes.loginScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const LoginScreen(),
                settings: settings,
              )
            : CupertinoPageRoute(builder: (context) => const LoginScreen());

      case Routes.signupScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const SignUpScreen(),
                settings: settings,
              )
            : CupertinoPageRoute(builder: (context) => const SignUpScreen());
      case Routes.forgetPasswordScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const ForgetPasswordScreen(),
                settings: settings,
              )
            : CupertinoPageRoute(
                builder: (context) => const ForgetPasswordScreen(),
              );
      case Routes.confirmScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const ConfirmScreen(),
                settings: settings,
              )
            : CupertinoPageRoute(builder: (context) => const ConfirmScreen());
      case Routes.userVerifyScreen:
        final args = settings.arguments as Map;
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: UserVerifyScreen(email: args['email']),
                settings: settings,
              )
            : CupertinoPageRoute(
                builder: (context) => UserVerifyScreen(email: args['email']),
              );
      case Routes.otpVerifyScreen:
        final args = settings.arguments as Map;
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: OtpVerifyScreen(email: args['email']),
                settings: settings,
              )
            : CupertinoPageRoute(
                builder: (context) => OtpVerifyScreen(email: args['email']),
              );
      case Routes.resetPasswordScreen:
        final args = settings.arguments as Map;
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: ResetPasswordScreen(
                  email: args['email'],
                  token: args['token'],
                ),
                settings: settings,
              )
            : CupertinoPageRoute(
                builder: (context) => ResetPasswordScreen(
                  email: args['email'],
                  token: args['token'],
                ),
              );

      case Routes.homeScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(widget: HomeScreen(), settings: settings)
            : CupertinoPageRoute(builder: (context) => HomeScreen());
      case Routes.information:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: InformationScreen(),
                settings: settings,
              )
            : CupertinoPageRoute(builder: (context) => InformationScreen());
      case Routes.cadabaj:
        return Platform.isAndroid
            ? _FadedTransitionRoute(widget: CadabajScreen(), settings: settings)
            : CupertinoPageRoute(builder: (context) => CadabajScreen());
      case Routes.bnpDofa:
        return Platform.isAndroid
            ? _FadedTransitionRoute(widget: BnpDofaScreen(), settings: settings)
            : CupertinoPageRoute(builder: (context) => BnpDofaScreen());
      case Routes.gallery:
        return Platform.isAndroid
            ? _FadedTransitionRoute(widget: GalleryScreen(), settings: settings)
            : CupertinoPageRoute(builder: (context) => GalleryScreen());
      case Routes.contactUs:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: ContactUsScreen(),
                settings: settings,
              )
            : CupertinoPageRoute(builder: (context) => ContactUsScreen());

      case Routes.myListing:
        return Platform.isAndroid
            ? _FadedTransitionRoute(widget: MyListScreen(), settings: settings)
            : CupertinoPageRoute(builder: (context) => MyListScreen());
      case Routes.aboutUsScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(widget: AboutUsScreen(), settings: settings)
            : CupertinoPageRoute(builder: (context) => AboutUsScreen());
      case Routes.aboutAppScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: AboutAppScreen(),
                settings: settings,
              )
            : CupertinoPageRoute(builder: (context) => AboutAppScreen());
      default:
        return null;
    }
  }
}

class _FadedTransitionRoute extends PageRouteBuilder {
  final Widget widget;
  @override
  final RouteSettings settings;

  _FadedTransitionRoute({required this.widget, required this.settings})
    : super(
        settings: settings,
        reverseTransitionDuration: const Duration(milliseconds: 1),
        pageBuilder:
            (
              BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
            ) {
              return widget;
            },
        transitionDuration: const Duration(milliseconds: 1),
        transitionsBuilder:
            (
              BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child,
            ) {
              return FadeTransition(
                opacity: CurvedAnimation(parent: animation, curve: Curves.ease),
                child: child,
              );
            },
      );
}

class ScreenTitle extends StatelessWidget {
  final Widget widget;

  const ScreenTitle({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: .5, end: 1),
      duration: const Duration(milliseconds: 500),
      curve: Curves.bounceIn,
      builder: (context, value, child) {
        return Opacity(opacity: value, child: child);
      },
      child: widget,
    );
  }
}
