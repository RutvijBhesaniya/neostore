import 'dart:async';

import 'package:dio/dio.dart';
import 'package:neostore/base/network_model/api_constant.dart';
import 'package:neostore/base/network_model/api_error.dart';
import 'package:neostore/base/network_model/api_handler.dart';
import 'package:neostore/data/web_service/api_impl/delete_cart_api/delete_cart_api.dart';
import 'package:neostore/utils/shared_preferences/memory_management.dart';

class DeleteCartApiImpl extends DeleteCartApi {
  @override
  Future getDeleteCartApi(int productId) async {
    Map<String, dynamic> map = Map<String, dynamic>();
    Map<String, String> mapToken = Map<String, String>();
    map.putIfAbsent("product_id", () => productId);
    mapToken.putIfAbsent("access_token", () => MemoryManagement.getAccessToken()!);
    Completer<dynamic> completer = new Completer<dynamic>();
    FormData formData = new FormData.fromMap(map);

    var response = await APIHandler.post(
        url: "${APIs.deleteCart}",
        additionalHeaders: mapToken,
        requestBody: formData);

    if (response is ApiError) {
      completer.complete(response);
      return completer.future;
    } else {
      completer.complete(response);
      return completer.future;
    }
  }
}
