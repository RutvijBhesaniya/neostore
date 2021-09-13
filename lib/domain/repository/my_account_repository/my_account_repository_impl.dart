import 'package:neostore/data/web_service/api_impl/my_account_api/my_account_api.dart';
import 'package:neostore/domain/repository/my_account_repository/my_account_repository.dart';

class MyAccountRepositoryImpl extends MyAccountRepository{
  late MyAccountApi _myAccountApi;

  MyAccountRepositoryImpl(MyAccountApi _myAccountApi){
    this._myAccountApi =_myAccountApi;
  }
  @override
  Future getMyAccountRepository() {
   return _myAccountApi.getLoginApi();
  }
}