import 'dart:convert';
import 'dart:developer';

import 'package:bnp_app/features/bnp_dofa/model/programme_image_response.dart';
import 'package:bnp_app/networks/dio/dio.dart';
import 'package:bnp_app/networks/endpoints.dart';
import 'package:bnp_app/networks/exception_handler/data_source.dart';
import 'package:dio/dio.dart';

final class GetProgrammeImageApi {
  static final GetProgrammeImageApi _singleton =
      GetProgrammeImageApi._internal();
  GetProgrammeImageApi._internal();

  static GetProgrammeImageApi get instance => _singleton;

  Future<GetProgrammeImageResponse> getProgrammeImge() async {
    try {
      Response response = await getHttp(EndPoints.getProgramme());
      if (response.statusCode == 200) {
        final data = GetProgrammeImageResponse.fromRawJson(
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
