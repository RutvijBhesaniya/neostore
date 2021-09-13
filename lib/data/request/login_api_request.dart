import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:neostore/base/network_model/api_constant.dart';
import 'package:neostore/base/network_model/api_error.dart';
import 'package:neostore/base/network_model/api_handler.dart';
import 'package:neostore/data/model/request/login_request.dart';

class LoginApiRequest{
  Future getLoginApi(LoginRequest loginRequest, BuildContext context) async {
    Completer<dynamic> completer = new Completer<dynamic>();
    FormData formData = new FormData.fromMap(loginRequest.toJson());

    var response = await APIHandler.post(
      url: "${APIs.login}",
      requestBody: formData,
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