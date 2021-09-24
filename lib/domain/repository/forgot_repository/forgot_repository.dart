import 'package:either_dart/either.dart';
import 'package:neostore/base/network_model/api_error.dart';
import 'package:neostore/domain/model/forgot_password.dart';

abstract class ForgotPasswordRepository {
  Future<Either<ForgotPassword,ApiError>> getForgotPasswordRepository(String email);
}
