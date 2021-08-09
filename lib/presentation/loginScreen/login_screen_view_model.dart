import 'package:flutter/material.dart';
import 'package:neostore/data/model/RegisterRequest.dart';
import 'package:neostore/data/webService/apiImpl/loginApi/loginApi_impl.dart';
import 'package:neostore/data/webService/repository/loginRepository/login_repository_impl.dart';
import 'package:neostore/domain/login_use_case.dart';
import 'package:neostore/presentation/registerScreen/register_screen.dart';

class LoginScreenProvider extends ChangeNotifier {
  LoginUseCase _loginUseCase =
      LoginUseCase(LoginRepositoryImpl(LoginApiImpl()));

  bool _isLoading = true;

  get isLoading => _isLoading;

  void getLogin(String username, String password, BuildContext context) async {
    _isLoading = true;
    var response = await _loginUseCase.callApi(username, password);
    print("response=>$response");
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RegisterScreen(),
      ),
    );
  }
}
