import 'dart:async';
import 'package:neostore/data/request/reset_password_api_request.dart';
import 'package:neostore/data/web_service/api_impl/reset_password_api/reset_password_api.dart';

class ResetPasswordApiImpl extends ResetPasswordApi {
  ResetPasswordApiImpl(this._resetPasswordApiRequest);

  final ResetPasswordApiRequest _resetPasswordApiRequest;


  @override
  Future getResetPasswordApi(String oldPassword, String password,
      String confirmPassword) {
    return _resetPasswordApiRequest.getResetPasswordApi(
        oldPassword, password, confirmPassword
    );
  }

}
