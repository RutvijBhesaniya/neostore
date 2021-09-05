import 'dart:async';
import 'package:dio/dio.dart';
import 'package:neostore/base/network_model/api_constant.dart';
import 'package:neostore/base/network_model/api_error.dart';
import 'package:neostore/base/network_model/api_handler.dart';
import 'package:neostore/data/web_service/api_impl/reset_password_api/reset_password_api.dart';
import 'package:neostore/utils/shared_preferences/memory_management.dart';

class ResetPasswordApiImpl extends ResetPasswordApi {
  @override
  Future getResetPasswordApi(
      String oldPassword,String password,String confirmPassword ) async {
    Map<String, dynamic> map = Map<String, dynamic>();
    Map<String, String> mapToken = Map<String, String>();
    map.putIfAbsent("old_password", () => oldPassword);
    map.putIfAbsent("password", () => password);
    map.putIfAbsent("confirm_password", () => confirmPassword);
    mapToken.putIfAbsent("access_token", () => MemoryManagement.getAccessToken()!);

    Completer<dynamic> completer = new Completer<dynamic>();
    FormData formData = new FormData.fromMap(map);

    var response = await APIHandler.post(
        url: "${APIs.reset}",
        requestBody: formData,
        additionalHeaders: mapToken,

    );


    if (response is ApiError) {
      completer.complete(response);
      return completer.future;
    } else {
      completer.complete(response);
      return completer.future;
    }

  }
}
