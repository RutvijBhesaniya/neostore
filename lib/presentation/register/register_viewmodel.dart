import 'package:flutter/material.dart';
import 'package:neostore/data/model/register_request.dart';
import 'package:neostore/data/web_service/api_impl/register_api/RegisterApi_impl.dart';
import 'package:neostore/data/web_service/repository/registerRepository/register_repository_impl.dart';
import 'package:neostore/domain/register_use_case.dart';
import 'package:neostore/presentation/login/login_view.dart';

class RegisterScreenProvider extends ChangeNotifier {
  RegisterUseCase _registerUseCase =
      RegisterUseCase(RegisterRepositoryImpl(RegisterApiImpl()));

  bool _isLoading = false;

  get isLoading => _isLoading;

  void getRegisterUser(
      RegisterRequest registerRequest, BuildContext context) async {
    _isLoading = true;
    var response = await _registerUseCase.callApi(registerRequest,context);
    print("response=>$response");
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
    _isLoading = false;
    notifyListeners();
  }
}
