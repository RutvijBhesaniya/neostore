import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:neostore/base/networkmodel/api_constant.dart';
import 'package:neostore/base/networkmodel/api_error.dart';
import 'package:neostore/base/networkmodel/api_handler.dart';
import 'package:neostore/data/model/LoginRequest.dart';
import 'package:neostore/data/webService/apiImpl/loginApi/loginApi.dart';

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
    if (response is APIError) {
      completer.complete(response);
      return completer.future;
    } else {
      completer.complete(response);
      return completer.future;
    }
  }
}
