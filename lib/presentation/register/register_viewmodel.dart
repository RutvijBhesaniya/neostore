import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:neostore/data/model/request/register_request.dart';
import 'package:neostore/data/model/response/register_response.dart';
import 'package:neostore/data/web_service/api_impl/register_api/RegisterApi_impl.dart';
import 'package:neostore/data/web_service/repository/register_repository/register_repository_impl.dart';
import 'package:neostore/domain/register_use_case.dart';

class RegisterScreenProvider extends ChangeNotifier {
  RegisterUseCase _registerUseCase =
      RegisterUseCase(RegisterRepositoryImpl(RegisterApiImpl()));
  late RegisterResponse _registerResponse;

  get registerResponse => _registerResponse;

  bool _isLoading = true;

  get isLoading => _isLoading;

  bool checkValue = false;

  void changeCheckValue(bool value){
    checkValue = value;
    notifyListeners();
  }

  Future<dynamic> getRegisterUser(
      RegisterRequest registerRequest, BuildContext context) async {
    _isLoading = true;
    var response = await _registerUseCase.callApi(registerRequest, context);

    print("response=>$response");

    _isLoading = false;
    return response;
  }
}


