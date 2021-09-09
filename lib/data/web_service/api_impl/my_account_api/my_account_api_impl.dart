import 'dart:async';
import 'package:neostore/base/network_model/api_constant.dart';
import 'package:neostore/base/network_model/api_error.dart';
import 'package:neostore/base/network_model/api_handler.dart';
import 'package:neostore/data/request/my_account_api_request.dart';
import 'package:neostore/data/web_service/api_impl/my_account_api/my_account_api.dart';
import 'package:neostore/utils/shared_preferences/memory_management.dart';

class MyAccountApiImpl implements MyAccountApi {
  final MyAccountApiRequest myAccountApiRequest;

  MyAccountApiImpl(this.myAccountApiRequest);

  @override
  Future getLoginApi() async {
    return myAccountApiRequest.getLoginApi();
    }
}
