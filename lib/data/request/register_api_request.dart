import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:neostore/base/network_model/api_constant.dart';
import 'package:neostore/base/network_model/api_error.dart';
import 'package:neostore/base/network_model/api_handler.dart';
import 'package:neostore/data/api/request/register_request.dart';

class RegisterApiRequest{
  Future getRegisterApi(
      RegisterRequest registerRequest, BuildContext context) async {
    Completer<dynamic> completer = new Completer<dynamic>();
    print("request=>,${registerRequest.toJson()}");
    FormData formData = new FormData.fromMap(registerRequest.toJson());
    var response = await APIHandler.post(
      url: "${APIs.register}",
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