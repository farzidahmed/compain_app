import 'dart:convert';

import 'package:bnp_app/features/auth/model/verify_otp_response.dart';
import 'package:dio/dio.dart';

import '/networks/endpoints.dart';
import '../../../../../../networks/dio/dio.dart';
import '../../../../../../networks/exception_handler/data_source.dart';

final class VerifyForgetPassOtpApi {
  static final VerifyForgetPassOtpApi _singleton =
      VerifyForgetPassOtpApi._internal();
  VerifyForgetPassOtpApi._internal();
  static VerifyForgetPassOtpApi get instance => _singleton;

  Future<VerifyotpResponse> verifyOtp({
    required String email,
    required String otp,
  }) async {
    try {
      Map data = {"email": email, "otp": otp};

      Response response = await postHttp(EndPoints.verifyForgetPass(), data);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = VerifyotpResponse.fromRawJson(json.encode(response.data));
        return data;
      } else {
        throw DataSource.DEFAULT.getFailure();
      }
    } catch (error) {
      rethrow;
    }
  }
}