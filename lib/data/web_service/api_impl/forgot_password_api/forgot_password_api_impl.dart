import 'dart:async';
import 'package:either_dart/either.dart';
import 'package:neostore/base/network_model/api_error.dart';
import 'package:neostore/data/request/forgot_password_api_request.dart';
import 'package:neostore/data/web_service/api_impl/forgot_password_api/forgot_password_api.dart';
import 'package:neostore/domain/model/forgot_password.dart';

class ForgotPasswordApiImpl extends ForgotPasswordApi {
  late ForgotPasswordApiRequest forgotPasswordApiRequest;

  ForgotPasswordApiImpl(this.forgotPasswordApiRequest);

  @override
  Future<Either<ForgotPassword,ApiError>> getForgotPasswordApi(String email) {
    return forgotPasswordApiRequest.getForgotPasswordApi(email);
  }
}
