import 'package:flutter/cupertino.dart';
import 'package:neostore/data/api/request/login_request.dart';

abstract class LoginRepository {
  Future<dynamic> getLoginRepository(LoginRequest loginRequest,BuildContext context);
}
