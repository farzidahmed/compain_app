import 'dart:convert';
import 'dart:developer';

import 'package:bnp_app/features/home/model/carasul_response.dart';
import 'package:bnp_app/networks/dio/dio.dart';
import 'package:bnp_app/networks/endpoints.dart';
import 'package:bnp_app/networks/exception_handler/data_source.dart';
import 'package:dio/dio.dart';

final class GetCarasulApi {
  static final GetCarasulApi _singleton = GetCarasulApi._internal();
  GetCarasulApi._internal();

  static GetCarasulApi get instance => _singleton;

  Future<CarasoulResponse> getCarasul() async {
    try {
      Response response = await getHttp(EndPoints.getCarasul());
      if (response.statusCode == 200) {
        final data = CarasoulResponse.fromRawJson(json.encode(response.data));
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
