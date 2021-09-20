import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:neostore/data/api/entity/forgot_password_entity.dart';
import 'package:neostore/data/api/entity/login_entity.dart';
import 'package:neostore/data/api/request/login_request.dart';
import 'package:neostore/data/web_service/api_impl/forgot_password_api/forgot_password_api_impl.dart';
import 'package:neostore/domain/repository/forgot_repository/forgot_repository_impl.dart';
import 'package:neostore/domain/use_case/forgot_use_case.dart';
import 'package:neostore/domain/use_case/login_use_case.dart';

class LoginScreenProvider extends ChangeNotifier {
  LoginUseCase _loginUseCase;

  LoginScreenProvider(this._loginUseCase);

  late LoginEntity _loginEntity;

  get loginResponse => _loginEntity;

  ForgotPasswordEntity? _forgotPasswordEntity;

  get forgotPasswordResponse => _forgotPasswordEntity;

  ForgotUseCase _forgotUseCase = ForgotUseCase(
    ForgotPasswordRepositoryImpl(ForgotPasswordApiImpl()),
  );

  bool _isLoading = true;

  get isLoading => _isLoading;


 ///get login method
  Future<dynamic> getLogin(
      LoginRequest loginRequest, BuildContext context) async {
    _isLoading = true;
    var response = await _loginUseCase.callApi(loginRequest, context);

    _isLoading = false;
    return response;
  }


  ///forgot password method
  void getForgotPassword(String email) async {
    _isLoading = true;
    var response = await _forgotUseCase.callApi(email);
    _forgotPasswordEntity =
        ForgotPasswordEntity.fromJson(jsonDecode(response));

    _isLoading = false;
    notifyListeners();
  }
}
