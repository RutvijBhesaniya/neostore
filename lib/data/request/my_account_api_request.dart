import 'dart:async';

import 'package:neostore/base/network_model/api_constant.dart';
import 'package:neostore/base/network_model/api_error.dart';
import 'package:neostore/base/network_model/api_handler.dart';
import 'package:neostore/utils/shared_preferences/memory_management.dart';

class MyAccountApiRequest {
  Future<dynamic> getLoginApi() async {
    Completer<dynamic> completer = new Completer<dynamic>();
    Map<String, String> map = Map();
    map.putIfAbsent('access_token', () => MemoryManagement.getAccessToken()!);

    var response = await APIHandler.get(
        additionalHeaders: map, url: "${APIs.fetchAccountDetail}");
    if (response is ApiError) {
      completer.complete(response);
      return completer.future;
    } else {
      completer.complete(response);
      return completer.future;
    }
  }
}