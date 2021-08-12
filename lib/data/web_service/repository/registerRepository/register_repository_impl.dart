import 'package:flutter/cupertino.dart';
import 'package:neostore/data/model/register_request.dart';
import 'package:neostore/data/web_service/api_impl/register_api/registerApi.dart';
import 'package:neostore/data/web_service/repository/registerRepository/register_repository.dart';

class RegisterRepositoryImpl implements RegisterRepository {
  late RegisterApi _registerApi;

  RegisterRepositoryImpl(RegisterApi _registerApi) {
    this._registerApi = _registerApi;
  }

  @override
  Future getRegisterRepository(RegisterRequest registerRequest,BuildContext context) {
    return _registerApi.getRegisterApi(registerRequest,context);
  }
}
