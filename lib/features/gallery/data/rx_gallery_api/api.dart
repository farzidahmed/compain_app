import 'dart:convert';
import 'dart:developer';

import 'package:bnp_app/features/gallery/model/get_gallery_response.dart';
import 'package:bnp_app/networks/dio/dio.dart';
import 'package:bnp_app/networks/endpoints.dart';
import 'package:bnp_app/networks/exception_handler/data_source.dart';
import 'package:dio/dio.dart';

final class GetChatListApi {
  static final GetChatListApi _singleton = GetChatListApi._internal();
  GetChatListApi._internal();

  static GetChatListApi get instance => _singleton;

  Future<GetGalleryResponse> getGallary() async {
    try {
      Response response = await getHttp(EndPoints.getGallry());
      if (response.statusCode == 200) {
        final data = GetGalleryResponse.fromRawJson(json.encode(response.data));
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
