import 'package:either_dart/either.dart';
import 'package:flutter/cupertino.dart';
import 'package:neostore/base/network_model/api_error.dart';
import 'package:neostore/data/api/request/login_request.dart';
import 'package:neostore/domain/model/login.dart';

abstract class LoginRepository {
  Future<Either<Login,ApiError>> getLoginRepository(LoginRequest loginRequest,BuildContext context);
}
