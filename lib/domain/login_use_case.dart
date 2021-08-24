import 'package:neostore/base/Base_use_case.dart';
import 'package:neostore/data/web_service/repository/login_repository/login_repository.dart';

class LoginUseCase extends BaseUseCase<dynamic> {
  late LoginRepository _loginRepository;

  LoginUseCase(LoginRepository _loginRepository) {
    this._loginRepository = _loginRepository;
  }

  @override
  Future callApi([loginRequest, context]) {
    return _loginRepository.getLoginRepository(loginRequest, context);
  }
}