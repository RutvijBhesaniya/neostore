import 'dart:async';
import 'package:dio/dio.dart';
import 'package:neostore/base/network_model/api_constant.dart';
import 'package:neostore/base/network_model/api_error.dart';
import 'package:neostore/base/network_model/api_handler.dart';
import 'package:neostore/data/web_service/api_impl/order_detail_api/order_detail_api.dart';
import 'package:neostore/utils/shared_preferences/memory_management.dart';

class OrderDetailApiImpl extends OrderDetailApi {
  @override
  Future getOrderDetailApi(int orderId) async {
    Map<String, dynamic> map = Map<String, dynamic>();
    Map<String, String> mapToken = Map<String, String>();
    mapToken.putIfAbsent(
        "access_token", () => MemoryManagement.getAccessToken()!);
    map.putIfAbsent("address", () => orderId);
    Completer<dynamic> completer = new Completer<dynamic>();
    FormData formData = new FormData.fromMap(map);

    var response = await APIHandler.post(
        url: "${APIs.orderDetail}",
        requestBody: formData,
        additionalHeaders: mapToken);
    print('gotOrderAddressresponse=>$response');
    if (response is APIError) {
      completer.complete(response);
      return completer.future;
    } else {
      completer.complete(response);
      return completer.future;
    }
  }
}