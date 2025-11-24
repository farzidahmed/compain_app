
import 'dart:developer';

import 'package:bnp_app/about-us/data/rx_about_us/api.dart';
import 'package:bnp_app/about-us/model/about_us_repsponse.dart';
import 'package:bnp_app/constants/app_constants.dart';
import 'package:bnp_app/helpers/all_routes.dart';
import 'package:bnp_app/helpers/di.dart';
import 'package:bnp_app/helpers/navigation_service.dart';
import 'package:bnp_app/helpers/toast.dart';
import 'package:bnp_app/networks/stream_cleaner.dart';
import 'package:dio/dio.dart';

import 'package:rxdart/streams.dart';


import '../../../../../networks/rx_base.dart';

final class TermsAndCOnditonRx extends RxResponseInt<AboutResponse> {
  TermsAndCOnditonRx({required super.empty, required super.dataFetcher});

  ValueStream get getPrivecyPolicyStream => dataFetcher.stream;
  final api = TermsAndConditonApi.instance;

  Future<bool> privecyPolicy() async {
    try {
      final data = await api.aboutUsApi();
      handleSuccessWithReturn(data);
      return true;
    } catch (error) {
      return handleErrorWithReturn(error);
    }
  }

  @override
  handleErrorWithReturn(dynamic error) {
    if (error is DioException) {
      if (error.response!.statusCode == 401) {
        totalDataClean();
        appData.write(kKeyIsLoggedIn, false);
        NavigationService.navigateToReplacementUntil(Routes.loginScreen);
      } else {
        ToastUtil.showErrorMessage(error.response!.data["message"]);
      }
    }
    log(error.toString());
    dataFetcher.sink.addError(error);
    // throw error;
    return false;
  }
}