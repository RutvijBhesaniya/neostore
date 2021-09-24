import 'package:either_dart/either.dart';
import 'package:neostore/base/network_model/api_error.dart';
import 'package:neostore/data/web_service/api_impl/forgot_password_api/forgot_password_api.dart';
import 'package:neostore/domain/model/forgot_password.dart';
import 'package:neostore/domain/repository/forgot_repository/forgot_repository.dart';

class ForgotPasswordRepositoryImpl implements ForgotPasswordRepository {
  late ForgotPasswordApi _forgotPasswordApi;

  ForgotPasswordRepositoryImpl(ForgotPasswordApi _forgotPasswordApi) {
    this._forgotPasswordApi = _forgotPasswordApi;
  }

  @override
  Future<Either<ForgotPassword,ApiError>> getForgotPasswordRepository(String email) {
    return _forgotPasswordApi.getForgotPasswordApi(email);
  }
}
