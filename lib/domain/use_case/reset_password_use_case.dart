import 'package:neostore/base/base_use_case.dart';
import 'package:neostore/domain/repository/reset_password_repository/reset_password_api_impl.dart';

class ResetPasswordUseCase extends BaseUseCase<dynamic> {
  late ResetPasswordRepository _resetPasswordRepository;

  ResetPasswordUseCase(ResetPasswordRepository resetPasswordRepository) {
    this._resetPasswordRepository = resetPasswordRepository;
  }

  @override
  Future callApi([ oldPassword, password, confirmPassword]) {
    return _resetPasswordRepository.getResetPasswordRepository(
         oldPassword, password, confirmPassword);
  }
}
