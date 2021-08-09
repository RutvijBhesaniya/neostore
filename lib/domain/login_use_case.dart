import 'package:neostore/base/BaseUseCase.dart';
import 'package:neostore/data/webService/repository/loginRepository/login_repository.dart';

class LoginUseCase extends BaseUseCase<dynamic> {
  late LoginRepository _loginRepository;

  LoginUseCase(LoginRepository _loginRepository) {
    this._loginRepository = _loginRepository;
  }

  @override
  Future callApi([username, password]) {
    return _loginRepository.getLoginRepository(username, password).then(
          (value) => print("case=>$value"),
        );
  }
}
