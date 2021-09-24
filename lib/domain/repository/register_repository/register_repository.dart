import 'package:either_dart/either.dart';
import 'package:flutter/cupertino.dart';
import 'package:neostore/base/network_model/api_error.dart';
import 'package:neostore/data/api/request/register_request.dart';
import 'package:neostore/domain/model/register.dart';

abstract class RegisterRepository {
  Future<Either<Register,ApiError>> getRegisterRepository(
      RegisterRequest registerRequest, BuildContext context);
}
