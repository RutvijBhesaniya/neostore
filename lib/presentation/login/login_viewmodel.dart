import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:neostore/data/model/request/login_request.dart';
import 'package:neostore/data/model/response/forgot_password_response.dart';
import 'package:neostore/data/model/response/login_response.dart';
import 'package:neostore/data/web_service/api_impl/forgot_password_api/forgot_password_api_impl.dart';
import 'package:neostore/data/web_service/repository/forgot_repository/forgot_repository_impl.dart';
import 'package:neostore/domain/forgot_use_case.dart';
import 'package:neostore/domain/login_use_case.dart';

class LoginScreenProvider extends ChangeNotifier {
  LoginUseCase _loginUseCase;

  LoginScreenProvider(this._loginUseCase);

  late LoginResponse _loginResponse;

  get loginResponse => _loginResponse;

  ForgotPasswordResponse? _forgotPasswordResponse;

  get forgotPasswordResponse => _forgotPasswordResponse;

  ForgotUseCase _forgotUseCase = ForgotUseCase(
    ForgotPasswordRepositoryImpl(ForgotPasswordApiImpl()),
  );

  bool _isLoading = true;

  get isLoading => _isLoading;

  Future<dynamic> getLogin(
      LoginRequest loginRequest, BuildContext context) async {
    _isLoading = true;
    var response = await _loginUseCase.callApi(loginRequest, context);

    _isLoading = false;
    return response;
  }

  void getForgotPassword(String email) async {
    _isLoading = true;
    var response = await _forgotUseCase.callApi(email);
    _forgotPasswordResponse =
        ForgotPasswordResponse.fromJson(jsonDecode(response));

    _isLoading = false;
    notifyListeners();
  }
}
