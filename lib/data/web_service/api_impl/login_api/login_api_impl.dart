import 'dart:async';
import 'package:either_dart/either.dart';
import 'package:flutter/cupertino.dart';
import 'package:neostore/base/network_model/api_error.dart';
import 'package:neostore/data/api/request/login_request.dart';
import 'package:neostore/data/request/login_api_request.dart';
import 'package:neostore/data/web_service/api_impl/login_api/login_api.dart';
import 'package:neostore/domain/model/login.dart';

class LoginApiImpl implements LoginApi {
  final LoginApiRequest _loginApiRequest;

  LoginApiImpl(this._loginApiRequest);

  @override
  Future<Either<Login,ApiError>> getLoginApi(LoginRequest loginRequest, BuildContext context) {
   return _loginApiRequest.getLoginApi(loginRequest, context);
  }
}
