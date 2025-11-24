import 'dart:convert';
import 'dart:developer';

import 'package:bnp_app/about-us/model/about_us_repsponse.dart';
import 'package:bnp_app/networks/dio/dio.dart';
import 'package:bnp_app/networks/endpoints.dart';
import 'package:bnp_app/networks/exception_handler/data_source.dart';
import 'package:dio/dio.dart';



final class TermsAndConditonApi {
  static final TermsAndConditonApi _singleton =
      TermsAndConditonApi._internal();
  TermsAndConditonApi._internal();

  static TermsAndConditonApi get instance => _singleton;

  Future<AboutResponse> aboutUsApi() async {
    try {
      Response response = await getHttp(EndPoints.termsAndCondition());
      if (response.statusCode == 200) {
        final data = AboutResponse.fromRawJson(
          json.encode(response.data),
        );
        return data;
      } else {
        log('Error: ${response.statusCode}');
        throw DataSource.DEFAULT.getFailure();
      }
    } catch (e) {
      rethrow;
    }
  }
}