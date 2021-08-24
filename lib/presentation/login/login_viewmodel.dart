import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:neostore/data/model/request/login_request.dart';
import 'package:neostore/data/model/response/forgot_password_response.dart';
import 'package:neostore/data/model/response/login_response.dart';
import 'package:neostore/data/web_service/api_impl/login_api/login_api_impl.dart';
import 'package:neostore/data/web_service/repository/login_repository/login_repository_impl.dart';
import 'package:neostore/domain/login_use_case.dart';

class LoginScreenProvider extends ChangeNotifier {
  late LoginResponse _loginResponse;

  get loginResponse => _loginResponse;

  LoginUseCase _loginUseCase =
      LoginUseCase(LoginRepositoryImpl(LoginApiImpl()));

  bool _isLoading = true;

  get isLoading => _isLoading;

  Future<dynamic> getLogin(
      LoginRequest loginRequest, BuildContext context) async {
    _isLoading = true;
    var response = await _loginUseCase.callApi(loginRequest, context);
    // _loginResponse = LoginResponse.fromJson(jsonDecode(response));

    print("responseruntime=>${response.runtimeType}");
    _isLoading = false;
    return response;
    notifyListeners();
  }
}
