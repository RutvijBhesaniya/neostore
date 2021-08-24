import 'package:flutter/src/widgets/framework.dart';
import 'package:neostore/data/model/response/my_account.dart';
import 'package:neostore/data/web_service/api_impl/my_account_api/my_account_api.dart';
import 'package:neostore/data/web_service/repository/my_account_repository/my_account_repository.dart';

class MyAccountRepositoryImpl extends MyAccountRepository{
  late MyAccountApi _myAccountApi;

  MyAccountRepositoryImpl(MyAccountApi _myAccountApi){
    this._myAccountApi =_myAccountApi;
  }
  @override
  Future getMyAccountRepository(MyAccountResponse myAccountResponse, BuildContext context) {
   return _myAccountApi.getLoginApi(myAccountResponse, context);
  }
}