import 'package:flutter/cupertino.dart';
import 'package:neostore/data/api/request/register_request.dart';

abstract class RegisterRepository {
  Future<dynamic> getRegisterRepository(
      RegisterRequest registerRequest, BuildContext context);
}
