import 'package:flutter/material.dart';
import 'package:neostore/data/model/RegisterRequest.dart';

abstract class RegisterApi {
  Future<dynamic> getRegisterApi(RegisterRequest registerRequest,BuildContext context);
}
