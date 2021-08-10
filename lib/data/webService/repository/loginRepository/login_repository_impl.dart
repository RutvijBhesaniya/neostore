import 'package:flutter/cupertino.dart';
import 'package:neostore/data/model/LoginRequest.dart';
import 'package:neostore/data/webService/apiImpl/loginApi/loginApi.dart';
import 'package:neostore/data/webService/repository/loginRepository/login_repository.dart';

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
