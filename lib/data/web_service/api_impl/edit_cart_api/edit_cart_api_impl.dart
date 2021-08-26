import 'dart:async';
import 'package:dio/dio.dart';
import 'package:neostore/base/network_model/api_constant.dart';
import 'package:neostore/base/network_model/api_error.dart';
import 'package:neostore/base/network_model/api_handler.dart';
import 'package:neostore/data/web_service/api_impl/edit_cart_api/edit_cart_api.dart';
import 'package:neostore/utils/shared_preferences/memory_management.dart';

class EditCartApiImpl extends EditCartApi {
  @override
  Future getEditCartApi(String productId, String quantity) async {
    Map<String, dynamic> map = Map<String, dynamic>();
    map.putIfAbsent("product_id", () => productId);
    map.putIfAbsent("quantity", () => quantity);
    map.putIfAbsent("access_token", () => MemoryManagement.getAccessToken());
    Completer<dynamic> completer = new Completer<dynamic>();
    FormData formData = new FormData.fromMap(map);

    var response = await APIHandler.post(
      url: "${APIs.editCart}",
      requestBody: formData,
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
