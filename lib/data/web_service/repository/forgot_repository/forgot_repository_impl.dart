import 'package:neostore/data/web_service/api_impl/forgot_password_api/forgot_password_api.dart';
import 'package:neostore/data/web_service/repository/forgot_repository/forgot_repository.dart';

class ForgotPasswordRepositoryImpl implements ForgotPasswordRepository {
  late ForgotPasswordApi _forgotPasswordApi;

  ForgotPasswordRepositoryImpl(ForgotPasswordApi _forgotPasswordApi) {
    this._forgotPasswordApi = _forgotPasswordApi;
  }

  @override
  Future getForgotPasswordRepository(String email) {
    return _forgotPasswordApi.getForgotPasswordApi(email);
  }
}
