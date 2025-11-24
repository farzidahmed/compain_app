// ignore_for_file: use_build_context_synchronously

import 'dart:developer';


import 'package:bnp_app/constants/app_constants.dart';
import 'package:bnp_app/features/home/data/rx_log_out/api.dart';
import 'package:bnp_app/helpers/di.dart';
import 'package:bnp_app/networks/stream_cleaner.dart';
import 'package:dio/dio.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../../helpers/toast.dart';
import '../../../../../networks/rx_base.dart';

final class LogoutRX extends RxResponseInt<Map> {
  final api = LogoutApi.instance;

  LogoutRX({required super.empty, required super.dataFetcher});

  ValueStream get getFileData => dataFetcher.stream;

  Future<bool> logOut() async {
    try {
      final data = await api.logout();
      handleSuccessWithReturn(data);
      return true;
    } catch (error) {
      return handleErrorWithReturn(error);
    }
  }

  @override
  void handleSuccessWithReturn(data) {
    appData.write(kKeyIsLoggedIn, false);
    totalDataClean();
    dataFetcher.sink.add(data);
  }

  @override
  handleErrorWithReturn(dynamic error) {
    if (error is DioException) {
      if (error.response!.statusCode == 401) {
        ToastUtil.showErrorMessage(error.response!.data["message"]);
      } else {
        ToastUtil.showErrorMessage(error.response!.data["message"]);
      }
    }
    log(error.toString());
    dataFetcher.sink.addError(error);
    return false;
  }
}