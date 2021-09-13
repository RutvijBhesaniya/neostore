import 'package:neostore/base/base_use_case.dart';
import 'package:neostore/domain/repository/forgot_repository/forgot_repository.dart';

class ForgotUseCase extends BaseUseCase<dynamic> {
  late ForgotPasswordRepository _forgotPasswordRepository;

  ForgotUseCase(ForgotPasswordRepository forgotPasswordRepository) {
    this._forgotPasswordRepository = forgotPasswordRepository;
  }

  @override
  Future callApi([email]) {
    return _forgotPasswordRepository.getForgotPasswordRepository(
        email);
  }
}
