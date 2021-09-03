import 'dart:async';

import 'package:dio/dio.dart';
import 'package:neostore/base/network_model/api_constant.dart';
import 'package:neostore/base/network_model/api_error.dart';
import 'package:neostore/base/network_model/api_handler.dart';
import 'package:neostore/data/web_service/api_impl/forgot_password_api/forgot_password_api.dart';

class ForgotPasswordApiImpl extends ForgotPasswordApi {
  @override
  Future getForgotPasswordApi(String email) async {
    Map<String,dynamic> map = Map<String,dynamic>();
    map.putIfAbsent("email", () => email);
    Completer<dynamic> completer = new Completer<dynamic>();
    FormData formData = new FormData.fromMap(map);

    var response = await APIHandler.post(
      url: "${APIs.forgot}",
      requestBody: formData
    );
    print('gotforgetpassword response=>$response');
    if (response is ApiError) {
      completer.complete(response);
      return completer.future;
    } else {
      completer.complete(response);
      return completer.future;
    }
  }
}
