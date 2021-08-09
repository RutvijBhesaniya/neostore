import 'package:neostore/data/webService/apiImpl/loginApi/loginApi.dart';
import 'package:neostore/data/webService/repository/loginRepository/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  late LoginApi _loginApi;

  LoginRepositoryImpl(LoginApi _loginApi) {
    this._loginApi = _loginApi;
  }

  @override
  Future getLoginRepository(String username, String password) {
    return _loginApi.getLoginApi(username, password);
  }
}
