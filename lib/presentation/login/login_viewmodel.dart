import 'dart:convert';

import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:neostore/base/network_model/api_error.dart';
import 'package:neostore/data/api/entity/forgot_password_entity.dart';
import 'package:neostore/data/api/entity/login_entity.dart';
import 'package:neostore/data/api/request/login_request.dart';
import 'package:neostore/data/web_service/api_impl/forgot_password_api/forgot_password_api_impl.dart';
import 'package:neostore/domain/model/forgot_password.dart';
import 'package:neostore/domain/repository/forgot_repository/forgot_repository_impl.dart';
import 'package:neostore/domain/use_case/forgot_use_case.dart';
import 'package:neostore/domain/use_case/login_use_case.dart';
import 'package:neostore/presentation/model/forgot_password_item.dart';
import 'package:neostore/presentation/model/login_item.dart';

class LoginScreenProvider extends ChangeNotifier {
  LoginUseCase _loginUseCase;
  ForgotUseCase _forgotUseCase;

  LoginScreenProvider(this._loginUseCase, this._forgotUseCase);

  bool _isLoading = true;

  get isLoading => _isLoading;

  ///get login method
  Future<Either<LoginItem, ApiError>> getLogin(
      LoginRequest loginRequest, BuildContext context) async {
    _isLoading = true;
    var value = await _loginUseCase.callApi(loginRequest, context);
    if (value.isLeft) {
      LoginItem _loginItem = value.left;
      _isLoading = false;
      return Left(_loginItem);
    } else {
      _isLoading = false;
      return Right(value.right);
    }
  }

  ///forgot password method
  Future<Either<ForgotPasswordItem, ApiError>> getForgotPassword(
      String email) async {
    _isLoading = true;
    var response = await _forgotUseCase.callApi(email);
    if (response.isLeft) {
      ForgotPasswordItem _forgotPasswordItem = response.left;
      _isLoading = false;
      return Left(_forgotPasswordItem);
    } else {
      _isLoading = false;
      return Right(response.right);
    }

  }
}
