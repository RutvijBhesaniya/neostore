import 'package:flutter/cupertino.dart';
import 'package:neostore/data/api/request/login_request.dart';
import 'package:neostore/data/web_service/api_impl/login_api/login_api.dart';
import 'package:neostore/domain/repository/login_repository/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  late LoginApi _loginApi;

  LoginRepositoryImpl(LoginApi _loginApi) {
    this._loginApi = _loginApi;
  }

  @override
  Future getLoginRepository(LoginRequest loginRequest,BuildContext context) {
    return _loginApi.getLoginApi(loginRequest,context);
  }
}
