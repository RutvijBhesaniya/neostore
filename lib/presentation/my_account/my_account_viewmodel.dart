import 'package:flutter/cupertino.dart';
import 'package:neostore/data/model/response/my_account.dart';
import 'package:neostore/data/web_service/api_impl/my_account_api/my_account_api.dart';
import 'package:neostore/data/web_service/api_impl/my_account_api/my_account_api_impl.dart';
import 'package:neostore/data/web_service/repository/my_account_repository/my_account_repository_impl.dart';
import 'package:neostore/domain/my_account_use_case.dart';

class MyAccountProvider extends ChangeNotifier {
  late MyAccountResponse _myAccountResponse;

  get myAccountResponse => _myAccountResponse;

  MyAccountUseCase _myAccountUseCase = MyAccountUseCase(
    MyAccountRepositoryImpl(
      MyAccountApiImpl(),
    ),
  );

  bool _isLoading = true;

  get isLoading => _isLoading;

  Future<dynamic> getMyAccount(
      MyAccountResponse myAccountResponse, BuildContext context) async {
    _isLoading = true;
    var response = await _myAccountUseCase.callApi(myAccountResponse, context);
    _isLoading = false;
    return response;
  }
}
