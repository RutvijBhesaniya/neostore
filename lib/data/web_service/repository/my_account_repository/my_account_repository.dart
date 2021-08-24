import 'package:flutter/cupertino.dart';
import 'package:neostore/data/model/response/my_account.dart';

abstract class MyAccountRepository {
  Future<dynamic> getMyAccountRepository(
      MyAccountResponse myAccountResponse, BuildContext context);
}
