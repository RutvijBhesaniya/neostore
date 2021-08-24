import 'package:flutter/material.dart';
import 'package:neostore/data/model/response/forgot_password_response.dart';

abstract class ForgotPasswordApi {
  Future<dynamic> getForgotPasswordApi(
      ForgotPasswordResponse forgotPasswordResponse, BuildContext context);
}
