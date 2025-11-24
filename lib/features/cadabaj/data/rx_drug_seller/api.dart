import 'dart:convert';
import 'dart:io';

import 'package:bnp_app/networks/dio/dio.dart';
import 'package:bnp_app/networks/endpoints.dart';
import 'package:bnp_app/networks/exception_handler/data_source.dart';
import 'package:dio/dio.dart';

final class DrugSellerApi {
  static final DrugSellerApi _singleton = DrugSellerApi._internal();
  DrugSellerApi._internal();

  static DrugSellerApi get instance => _singleton;

  Future<Map> drug({
    required String name,
    required String phone,
    required String policeStation,
    required String word,
    required String complainSuggetion,

    File? image,
  }) async {
    try {
      FormData data = FormData.fromMap({
        "name": name,
        'phone_number': phone,
        'police_station': policeStation,
        'word': word,
        'complain_suggestion': complainSuggetion,
      });
      if (image != null && await File(image.path).exists()) {
        data.files.add(
          MapEntry('image', await MultipartFile.fromFile(image.path)),
        );
      }
      Response response = await postHttp(EndPoints.drug(), data);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = json.decode(json.encode(response.data));
        return data;
      } else {
        throw DataSource.DEFAULT.getFailure();
      }
    } catch (e) {
      rethrow;
    }
  }
}
