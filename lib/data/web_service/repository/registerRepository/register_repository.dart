import 'package:flutter/cupertino.dart';
import 'package:neostore/data/model/register_request.dart';

abstract class RegisterRepository {
  Future<dynamic> getRegisterRepository(RegisterRequest registerRequest,BuildContext context);
}
