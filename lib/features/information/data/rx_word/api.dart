import 'dart:convert';
import 'dart:developer';

import 'package:bnp_app/features/information/model/area_response.dart';
import 'package:bnp_app/networks/dio/dio.dart';
import 'package:bnp_app/networks/endpoints.dart';
import 'package:bnp_app/networks/exception_handler/data_source.dart';
import 'package:dio/dio.dart';

final class GetWordApi {
  static final GetWordApi _singleton = GetWordApi._internal();
  GetWordApi._internal();

  static GetWordApi get instance => _singleton;

  Future<AreaResponse> word({required String policeStation}) async {
    try {
      Response response = await getHttp(EndPoints.word(policeStation));
      if (response.statusCode == 200) {
        final data = AreaResponse.fromRawJson(json.encode(response.data));
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
