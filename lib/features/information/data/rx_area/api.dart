import 'dart:convert';
import 'dart:developer';

import 'package:bnp_app/features/information/model/get_area_response.dart';
import 'package:bnp_app/networks/dio/dio.dart';
import 'package:bnp_app/networks/endpoints.dart';
import 'package:bnp_app/networks/exception_handler/data_source.dart';
import 'package:dio/dio.dart';

final class GetAreaApi {
  static final GetAreaApi _singleton = GetAreaApi._internal();
  GetAreaApi._internal();

  static GetAreaApi get instance => _singleton;

  Future<GetAreaResponse> getArea() async {
    try {
      Response response = await getHttp(EndPoints.getArea());
      if (response.statusCode == 200) {
        final data = GetAreaResponse.fromRawJson(json.encode(response.data));
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
