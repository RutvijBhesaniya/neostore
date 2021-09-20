import 'package:flutter/cupertino.dart';
import 'package:neostore/data/api/request/login_request.dart';

abstract class LoginApi {
  Future<dynamic> getLoginApi(LoginRequest loginRequest,BuildContext context);
}
