// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:bnp_app/features/auth/data/rx_otp_verify/api.dart';
import 'package:bnp_app/features/auth/model/verify_otp_response.dart';
import 'package:dio/dio.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../../../helpers/toast.dart';
import '../../../../../../networks/rx_base.dart';

final class VerifyForgetPassOtpRx extends RxResponseInt<VerifyotpResponse> {
  String? errorMessage;
  String? resetToken;
  final api = VerifyForgetPassOtpApi.instance;

  VerifyForgetPassOtpRx({required super.empty, required super.dataFetcher});

  ValueStream get getFileData => dataFetcher.stream;

  Future<bool> verifyOtp({required String email, required String otp}) async {
    try {
      final data = await api.verifyOtp(email: email, otp: otp);
      handleSuccessWithReturn(data);
      resetToken = data.token;
      log("Token  is ============> $resetToken");
      return true;
    } catch (error) {
      return handleErrorWithReturn(error);
    }
  }

  @override
  handleErrorWithReturn(error) {
    if (error is DioException) {
      if (error.response!.statusCode == 400) {
        ToastUtil.showErrorMessage(error.response!.data["message"]);
      } else if (error.response!.data['code'] == 403) {
        errorMessage = error.response!.data['message'];
      } else {
        ToastUtil.showErrorMessage(error.response!.data['message']);
      }
    }
    // log(error.toString());
    dataFetcher.sink.addError(error);
    return false;
  }
}