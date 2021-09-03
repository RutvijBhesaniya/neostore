import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:neostore/base/network_model/api_constant.dart';
import 'package:neostore/base/network_model/api_error.dart';
import 'package:neostore/base/network_model/api_handler.dart';
import 'package:neostore/data/model/request/login_request.dart';
import 'package:neostore/data/web_service/api_impl/login_api/login_api.dart';

class LoginApiImpl implements LoginApi {
  @override
  Future getLoginApi(LoginRequest loginRequest, BuildContext context) async {
    Completer<dynamic> completer = new Completer<dynamic>();
    FormData formData = new FormData.fromMap(loginRequest.toJson());

    var response = await APIHandler.post(
      url: "${APIs.login}",
      requestBody: formData,
      context: context,
    );
    print('gotResponseinLoginApiImpl=>$response');
    if (response is ApiError) {
      completer.complete(response);
      return completer.future;
    } else {
      completer.complete(response);
      return completer.future;
    }
  }
}
