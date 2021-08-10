import 'package:flutter/cupertino.dart';
import 'package:neostore/data/model/LoginRequest.dart';

abstract class LoginRepository {
  Future<dynamic> getLoginRepository(LoginRequest loginRequest,BuildContext context);
}
