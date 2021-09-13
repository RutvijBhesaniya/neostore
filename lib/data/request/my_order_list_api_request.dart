import 'dart:async';

import 'package:neostore/base/network_model/api_constant.dart';
import 'package:neostore/base/network_model/api_error.dart';
import 'package:neostore/base/network_model/api_handler.dart';
import 'package:neostore/utils/shared_preferences/memory_management.dart';

class MyOrderListApiRequest{
  Future getOrderListApi() async {
    Map<String, String> mapToken = Map<String, String>();
    mapToken.putIfAbsent(
        "access_token", () => MemoryManagement.getAccessToken()!);
    Completer<dynamic> completer = new Completer<dynamic>();

    var response = await APIHandler.get(
      url: "${APIs.orderList}",
      additionalHeaders: mapToken,
    );
    if (response is ApiError) {
      completer.complete(response);
      return completer.future;
    } else {
      completer.complete(response);
      return completer.future;
    }
  }

}