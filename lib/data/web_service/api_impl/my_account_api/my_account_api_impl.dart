import 'dart:async';
import 'package:neostore/data/request/my_account_api_request.dart';
import 'package:neostore/data/web_service/api_impl/my_account_api/my_account_api.dart';

class MyAccountApiImpl implements MyAccountApi {
  final MyAccountApiRequest myAccountApiRequest;

  MyAccountApiImpl(this.myAccountApiRequest);

  @override
  Future getLoginApi() async {
    return myAccountApiRequest.getLoginApi();
    }
}
