

import 'dart:async';

import 'package:neostore/base/networkmodel/api_constant.dart';
import 'package:neostore/base/networkmodel/api_error.dart';
import 'package:neostore/base/networkmodel/api_handler.dart';
import 'package:neostore/data/model/RegisterRequest.dart';
import 'package:neostore/data/webService/apiImpl/registerApi/registerApi.dart';

class RegisterApiImpl implements RegisterApi {
  @override
  Future getRegisterApi(RegisterRequest registerRequest) async {
    Completer<dynamic> completer = new Completer<dynamic>();
    var response = await APIHandler.get(
      url: "${APIs.register}",
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
