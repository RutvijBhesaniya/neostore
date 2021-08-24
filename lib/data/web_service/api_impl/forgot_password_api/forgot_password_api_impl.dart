import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:neostore/base/network_model/api_constant.dart';
import 'package:neostore/base/network_model/api_error.dart';
import 'package:neostore/base/network_model/api_handler.dart';
import 'package:neostore/data/model/response/forgot_password_response.dart';
import 'package:neostore/data/web_service/api_impl/forgot_password_api/forgot_password_api.dart';

class ForgotPasswordApiImpl extends ForgotPasswordApi {
  @override
  Future getForgotPasswordApi(ForgotPasswordResponse forgotPasswordResponse,
      BuildContext context) async {
    Completer<dynamic> completer = new Completer<dynamic>();
    FormData formData = new FormData.fromMap(forgotPasswordResponse.toJson());

    var response = await APIHandler.post(
      url: "${APIs.forgot}",
      requestBody: formData,
      context: context,
    );
    print('gotforgetpassword response=>${response}');
    if (response is APIError) {
      completer.complete(response);
      return completer.future;
    } else {
      completer.complete(response);
      return completer.future;
    }
  }
}
