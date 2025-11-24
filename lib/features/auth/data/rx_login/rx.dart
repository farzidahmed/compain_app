// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:bnp_app/features/auth/data/rx_login/api.dart';
import 'package:bnp_app/features/auth/model/login_response.dart';
import 'package:bnp_app/helpers/toast.dart';
import 'package:bnp_app/networks/dio/dio.dart';
import 'package:dio/dio.dart';
import 'package:rxdart/rxdart.dart';


import '../../../../../../constants/app_constants.dart';
import '../../../../../../helpers/di.dart';
import '../../../../../../networks/rx_base.dart';

final class LoginRx extends RxResponseInt<LoginResponse> {
  String? errorMessage;
  final api = LoginApi.instance;

  LoginRx({required super.empty, required super.dataFetcher});

  ValueStream get getFileData => dataFetcher.stream;

  Future<bool> login({required String email, required String password}) async {
    try {
      // final data = await api.login(id: id);
      // handleSuccessWithReturn(data);
      final data = await api.login(email: email, password: password);
      handleSuccessWithReturn(data);
      return true;
    } catch (error) {
      return handleErrorWithReturn(error);
    }
  }

  @override
  handleSuccessWithReturn(LoginResponse data) {
    errorMessage = null;
    appData.write(kKeyAccessToken, data.token);
    appData.write(kKeyIsLoggedIn, true);
    log("user id??????????????????????${data.data?.id}");
    String token = appData.read(kKeyAccessToken);
    DioSingleton.instance.update(token);
    dataFetcher.sink.add(data);
    return data;
  }

 @override
handleErrorWithReturn(error) {
  if (error is DioException) {
    final response = error.response;

    if (response != null) {
      final statusCode = response.statusCode;
      final message = response.data?['message'] ?? "Please check your email and password";

      if (statusCode == 400 || response.data?['code'] == 403) {
        errorMessage = message;
        ToastUtil.showLongToast(message);
      } else {
        errorMessage = message;
        ToastUtil.showLongToast(message);
      }
    } else {
      // যখন response null (যেমন: internet না থাকা)
      errorMessage = "Something went wrong. Please check your internet connection.";
      ToastUtil.showLongToast(errorMessage!);
    }
  } else {
    errorMessage = "Unexpected error occurred.";
    ToastUtil.showLongToast(errorMessage!);
  }

  dataFetcher.sink.addError(error);
  return false;
}
}