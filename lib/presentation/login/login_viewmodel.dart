import 'package:flutter/material.dart';
import 'package:neostore/data/model/login_request.dart';
import 'package:neostore/data/web_service/api_impl/login_api/login_api_impl.dart';
import 'package:neostore/data/web_service/repository/loginRepository/login_repository_impl.dart';
import 'package:neostore/domain/login_use_case.dart';
import 'package:neostore/presentation/home/home_view.dart';

class LoginScreenProvider extends ChangeNotifier {
  LoginUseCase _loginUseCase =
      LoginUseCase(LoginRepositoryImpl(LoginApiImpl()));

  bool _isLoading = true;

  get isLoading => _isLoading;

  void getLogin(LoginRequest loginRequest, BuildContext context) async {
    _isLoading = true;
    var response = await _loginUseCase.callApi(loginRequest,context);
    print("response=>$response");
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HomeScreen(),
      ),
    );
    _isLoading = false;
    notifyListeners();
  }
}
