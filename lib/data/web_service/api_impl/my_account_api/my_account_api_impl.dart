import 'dart:async';

import 'package:flutter/material.dart';
import 'package:neostore/base/network_model/api_constant.dart';
import 'package:neostore/base/network_model/api_error.dart';
import 'package:neostore/base/network_model/api_handler.dart';
import 'package:neostore/data/model/response/my_account.dart';
import 'package:neostore/data/web_service/api_impl/my_account_api/my_account_api.dart';
import 'package:neostore/utils/shared_preferences/memory_management.dart';

class MyAccountApiImpl implements MyAccountApi {
  @override
  Future getLoginApi(
      MyAccountResponse myAccountResponse, BuildContext context) async {
    Completer<dynamic> completer = new Completer<dynamic>();
    // FormData formData = new FormData.fromMap(loginRequest.toJson());

    var response = await APIHandler.get(
      url: "${APIs.fetchAccountDetail}",
      // requestBody: MemoryManagement.getAccessToken(),
      context: context,
    );
    print('gotResponseinLoginApiImpl=>${response}');
    if (response is APIError) {
      completer.complete(response);
      return completer.future;
    } else {
      completer.complete(response);
      return completer.future;
    }
  }
}
