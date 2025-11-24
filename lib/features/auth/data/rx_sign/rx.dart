// ignore_for_file: use_build_context_synchronously

import 'package:bnp_app/features/auth/data/rx_sign/api.dart';
import 'package:bnp_app/helpers/toast.dart';
import 'package:dio/dio.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../../../networks/rx_base.dart';

final class SignupRx extends RxResponseInt<Map> {
  String? errorMessage;
  String? savePass;
  final api = SignupApi.instance;

  SignupRx({required super.empty, required super.dataFetcher});

  ValueStream get getFileData => dataFetcher.stream;

  Future<bool> signup({
    required String name,
    required String email,
    required String password,
  required String confirmPassword,
    bool? isTermAccepted,
  }) async {
    try {
      final data = await api.signup(
        
        email: email,
        password: password,
        isTermAccepted: isTermAccepted, name: name, confirmPassword: confirmPassword, 
      );
      handleSuccessWithReturn(data);
      savePass = password;
     

      return true;
    } catch (error) {
      return handleErrorWithReturn(error);
    }
  }

  @override
  handleErrorWithReturn(error) {
    if (error is DioException) {
      if (error.response!.statusCode == 400) {
        ToastUtil.showLongToast(errorMessage = error.response!.data['message']);
      } else if (error.response!.data['code'] == 403) {
        ToastUtil.showLongToast(errorMessage = error.response!.data['message']);
      } else {
        ToastUtil.showLongToast(errorMessage = error.response!.data['message']);
      }
    }
    // log(error.toString());
    dataFetcher.sink.addError(error);
    return false;
  }
}