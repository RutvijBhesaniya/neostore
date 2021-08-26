import 'package:neostore/base/Base_use_case.dart';
import 'package:neostore/data/web_service/repository/reset_password_repository/reset_password_api_impl.dart';

class ResetPasswordUseCase extends BaseUseCase<dynamic> {
  late ResetPasswordRepository _resetPasswordRepository;

  ResetPasswordUseCase(ResetPasswordRepository resetPasswordRepository) {
    this._resetPasswordRepository = resetPasswordRepository;
  }

  @override
  Future callApi([oldPassword, password, confirmPassword]) {
    return _resetPasswordRepository.getResetPasswordRepository(
        oldPassword, password, confirmPassword);
  }
}
