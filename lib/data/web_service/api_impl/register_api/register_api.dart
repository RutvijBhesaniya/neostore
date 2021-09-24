import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:neostore/base/network_model/api_error.dart';
import 'package:neostore/data/api/request/register_request.dart';
import 'package:neostore/domain/model/register.dart';

abstract class RegisterApi {
  Future<Either<Register, ApiError>> getRegisterApi(
      RegisterRequest registerRequest, BuildContext context);
}
