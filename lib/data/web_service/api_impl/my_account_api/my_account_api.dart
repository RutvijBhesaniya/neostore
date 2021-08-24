import 'package:flutter/material.dart';
import 'package:neostore/data/model/response/my_account.dart';

abstract class MyAccountApi {
  Future<dynamic> getLoginApi(MyAccountResponse myAccountResponse,BuildContext context);
}
