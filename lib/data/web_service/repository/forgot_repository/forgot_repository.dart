import 'package:flutter/cupertino.dart';
import 'package:neostore/data/model/response/forgot_password_response.dart';

abstract class ForgotPasswordRepository {
  Future<dynamic> getForgotPasswordRepository(
      ForgotPasswordResponse forgotPasswordResponse, BuildContext context);
}
