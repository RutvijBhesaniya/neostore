import 'package:flutter/material.dart';
import 'package:neostore/data/model/request/login_request.dart';
import 'package:neostore/data/web_service/api_impl/login_api/login_api_impl.dart';
import 'package:neostore/data/web_service/repository/login_repository/login_repository_impl.dart';
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
    if(response.statusCode == 200){
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ),
      );
    }else{
      print('Please Register');
    }
    _isLoading = false;
    notifyListeners();
  }
}
