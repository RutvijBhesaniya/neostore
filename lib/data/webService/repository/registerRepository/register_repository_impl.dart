

import 'package:flutter/cupertino.dart';
import 'package:neostore/data/model/RegisterRequest.dart';
import 'package:neostore/data/webService/apiImpl/registerApi/registerApi.dart';
import 'package:neostore/data/webService/repository/registerRepository/register_repository.dart';

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
