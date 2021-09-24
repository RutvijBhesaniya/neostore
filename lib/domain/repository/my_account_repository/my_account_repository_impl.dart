import 'package:either_dart/either.dart';
import 'package:neostore/base/network_model/api_error.dart';
import 'package:neostore/data/web_service/api_impl/my_account_api/my_account_api.dart';
import 'package:neostore/domain/model/my_account.dart';
import 'package:neostore/domain/repository/my_account_repository/my_account_repository.dart';
import 'package:neostore/presentation/model/my_account_item.dart';

class MyAccountRepositoryImpl extends MyAccountRepository{
  late MyAccountApi _myAccountApi;

  MyAccountRepositoryImpl(MyAccountApi _myAccountApi){
    this._myAccountApi =_myAccountApi;
  }
  @override
  Future<Either<MyAccount, ApiError>> getMyAccountRepository() {
   return _myAccountApi.getLoginApi();
  }
}