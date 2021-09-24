import 'package:either_dart/either.dart';
import 'package:neostore/base/network_model/api_error.dart';
import 'package:neostore/domain/model/forgot_password.dart';

abstract class ForgotPasswordApi {
  Future<Either<ForgotPassword,ApiError>> getForgotPasswordApi(
      String email);
}
