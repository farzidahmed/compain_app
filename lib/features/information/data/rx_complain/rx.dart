import 'dart:developer';
import 'dart:io';

import 'package:bnp_app/constants/app_constants.dart';
import 'package:bnp_app/features/information/data/rx_complain/api.dart';
import 'package:bnp_app/helpers/all_routes.dart';
import 'package:bnp_app/helpers/di.dart';
import 'package:bnp_app/helpers/navigation_service.dart';
import 'package:bnp_app/helpers/toast.dart';
import 'package:bnp_app/networks/rx_base.dart';
import 'package:bnp_app/networks/stream_cleaner.dart';
import 'package:dio/dio.dart';
import 'package:rxdart/streams.dart';

final class ComplainRx extends RxResponseInt<Map> {
  ComplainRx({required super.empty, required super.dataFetcher});

  ValueStream get getCartStream => dataFetcher.stream;
  final api = ComplainAPi.instance;

  Future<bool> complain({
    required String name,
    required String phone,
    required String policeStation,
    required String word,
    required String complainSuggetion,

    File? image,
  }) async {
    try {
      final data = await api.complain(
        name: name,
        phone: phone,
        policeStation:policeStation,
        word: word,
        complainSuggetion: complainSuggetion,
        image: image
      );
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
