import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:neostore/data/model/request/register_request.dart';
import 'package:neostore/data/request/register_api_request.dart';
import 'package:neostore/data/web_service/api_impl/register_api/registerApi.dart';

class RegisterApiImpl implements RegisterApi {
 final RegisterApiRequest _registerApiRequest;

 RegisterApiImpl(this._registerApiRequest);

  @override
  Future getRegisterApi(RegisterRequest registerRequest, BuildContext context) {
   return _registerApiRequest.getRegisterApi(registerRequest, context);
  }
}
