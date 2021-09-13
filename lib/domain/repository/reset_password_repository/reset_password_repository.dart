import 'package:neostore/data/web_service/api_impl/reset_password_api/reset_password_api.dart';
import 'package:neostore/domain/repository/reset_password_repository/reset_password_api_impl.dart';

class ResetPasswordRepositoryImpl implements ResetPasswordRepository {
  late ResetPasswordApi _resetPasswordApi;

  ResetPasswordRepositoryImpl(ResetPasswordApi _resetPasswordApi) {
    this._resetPasswordApi = _resetPasswordApi;
  }

  @override
  Future getResetPasswordRepository(
      String oldPassword,String password,String confirmPassword) {
    return _resetPasswordApi.getResetPasswordApi(
        oldPassword,password,confirmPassword);
  }
}
