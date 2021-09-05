import 'dart:async';

import 'package:neostore/base/network_model/api_constant.dart';
import 'package:neostore/base/network_model/api_error.dart';
import 'package:neostore/base/network_model/api_handler.dart';
import 'package:neostore/data/web_service/api_impl/order_list_api/order_list_api.dart';
import 'package:neostore/utils/shared_preferences/memory_management.dart';

class OrderListApiImpl extends OrderListApi {
  @override
  Future getOrderListApi() async {
    Map<String, String> mapToken = Map<String, String>();
    mapToken.putIfAbsent(
        "access_token", () => MemoryManagement.getAccessToken()!);
    Completer<dynamic> completer = new Completer<dynamic>();
    // FormData formData = new FormData.fromMap(mapToken);

    var response = await APIHandler.get(
        url: "${APIs.orderList}",
        // requestBody: formData,
        additionalHeaders: mapToken,
    );
    print('gotOrderListresponse=>$response');
    if (response is ApiError) {
      completer.complete(response);
      return completer.future;
    } else {
      completer.complete(response);
      return completer.future;
    }
  }
}
