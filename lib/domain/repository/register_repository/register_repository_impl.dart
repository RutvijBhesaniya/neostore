import 'package:either_dart/either.dart';
import 'package:flutter/cupertino.dart';
import 'package:neostore/base/network_model/api_error.dart';
import 'package:neostore/data/api/request/register_request.dart';
import 'package:neostore/data/web_service/api_impl/register_api/register_api.dart';
import 'package:neostore/domain/model/register.dart';
import 'package:neostore/domain/repository/register_repository/register_repository.dart';

class RegisterRepositoryImpl implements RegisterRepository {
  late RegisterApi _registerApi;

  RegisterRepositoryImpl(RegisterApi _registerApi) {
    this._registerApi = _registerApi;
  }

  @override
  Future<Either<Register,ApiError>> getRegisterRepository(RegisterRequest registerRequest,BuildContext context) {
    return _registerApi.getRegisterApi(registerRequest,context);
  }
}
