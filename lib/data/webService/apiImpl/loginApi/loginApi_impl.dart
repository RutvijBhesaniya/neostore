import 'dart:async';

import 'package:neostore/base/networkmodel/api_constant.dart';
import 'package:neostore/base/networkmodel/api_error.dart';
import 'package:neostore/base/networkmodel/api_handler.dart';
import 'package:neostore/data/webService/apiImpl/loginApi/loginApi.dart';

class LoginApiImpl implements LoginApi {
  @override
  Future getLoginApi(String username, String password) async {
    Completer<dynamic> completer = new Completer<dynamic>();
    var response = await APIHandler.get(
      url: "${APIs.login}",
      context: APIs.context,
    );
    if (response is APIError) {
      completer.complete(response);
      return completer.future;
    } else {
      completer.complete(response);
      return completer.future;
    }
  }
}
