import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:neostore/base/networkmodel/api_constant.dart';
import 'package:neostore/base/networkmodel/api_error.dart';
import 'package:neostore/base/networkmodel/api_handler.dart';
import 'package:neostore/data/model/RegisterRequest.dart';
import 'package:neostore/data/webService/apiImpl/registerApi/registerApi.dart';

class RegisterApiImpl implements RegisterApi {
  @override
  Future getRegisterApi(RegisterRequest registerRequest,BuildContext context) async {
    Completer<dynamic> completer = new Completer<dynamic>();
    print("request=>,${registerRequest.toJson()}");
    FormData formData = new FormData.fromMap(registerRequest.toJson());
    var response = await APIHandler.post(
        url: "${APIs.register}", requestBody: formData,context: context);
    if (response is APIError) {
      completer.complete(response);
      return completer.future;
    } else {
      completer.complete(response);
      return completer.future;
    }
  }
}
