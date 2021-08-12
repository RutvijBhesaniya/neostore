import 'package:flutter/material.dart';
import 'package:neostore/data/model/register_request.dart';

abstract class RegisterApi {
  Future<dynamic> getRegisterApi(RegisterRequest registerRequest,BuildContext context);
}
