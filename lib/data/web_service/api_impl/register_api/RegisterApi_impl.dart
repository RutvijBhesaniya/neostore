import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:neostore/base/network_model/api_constant.dart';
import 'package:neostore/base/network_model/api_error.dart';
import 'package:neostore/base/network_model/api_handler.dart';
import 'package:neostore/data/model/request/register_request.dart';
import 'package:neostore/data/web_service/api_impl/register_api/registerApi.dart';

class RegisterApiImpl implements RegisterApi {
  @override
  Future getRegisterApi(
      RegisterRequest registerRequest, BuildContext context) async {
    Completer<dynamic> completer = new Completer<dynamic>();
    print("request=>,${registerRequest.toJson()}");
    FormData formData = new FormData.fromMap(registerRequest.toJson());
    var response = await APIHandler.post(
      url: "${APIs.register}",
      requestBody: formData,
      context: context,
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
