import 'dart:async';
import 'package:either_dart/either.dart';
import 'package:flutter/cupertino.dart';
import 'package:neostore/base/network_model/api_error.dart';
import 'package:neostore/data/api/request/register_request.dart';
import 'package:neostore/data/request/register_api_request.dart';
import 'package:neostore/data/web_service/api_impl/register_api/register_api.dart';
import 'package:neostore/domain/model/register.dart';

class RegisterApiImpl implements RegisterApi {
 final RegisterApiRequest _registerApiRequest;

 RegisterApiImpl(this._registerApiRequest);

  @override
  Future<Either<Register,ApiError>> getRegisterApi(RegisterRequest registerRequest, BuildContext context) {
   return _registerApiRequest.getRegisterApi(registerRequest, context);
  }
}
