import 'package:either_dart/either.dart';
import 'package:flutter/cupertino.dart';
import 'package:neostore/base/network_model/api_error.dart';
import 'package:neostore/data/api/request/login_request.dart';
import 'package:neostore/domain/model/login.dart';

abstract class LoginApi {
  Future<Either<Login,ApiError>> getLoginApi(LoginRequest loginRequest,BuildContext context);
}
