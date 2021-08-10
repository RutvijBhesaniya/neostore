import 'package:flutter/material.dart';
import 'package:neostore/data/model/RegisterRequest.dart';
import 'package:neostore/data/webService/apiImpl/registerApi/RegisterApi_impl.dart';
import 'package:neostore/data/webService/repository/registerRepository/register_repository_impl.dart';
import 'package:neostore/domain/register_use_case.dart';
import 'package:neostore/presentation/loginScreen/login_screen.dart';

class RegisterScreenProvider extends ChangeNotifier {
  RegisterUseCase _registerUseCase =
      RegisterUseCase(RegisterRepositoryImpl(RegisterApiImpl()));

  bool _isLoading = false;

  get isLoading => _isLoading;

  void getRegisterUser(
      RegisterRequest registerRequest, BuildContext context) async {
    _isLoading = true;
    var response = await _registerUseCase.callApi(registerRequest,context);
    print("response=>${response}");
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
    _isLoading = false;
    notifyListeners();
  }
}
