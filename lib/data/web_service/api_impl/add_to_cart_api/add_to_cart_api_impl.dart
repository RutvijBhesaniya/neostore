import 'dart:async';
import 'package:dio/dio.dart';
import 'package:neostore/base/network_model/api_constant.dart';
import 'package:neostore/base/network_model/api_error.dart';
import 'package:neostore/base/network_model/api_handler.dart';
import 'package:neostore/data/web_service/api_impl/add_to_cart_api/add_to_cart_api.dart';
import 'package:neostore/utils/shared_preferences/memory_management.dart';

class AddToCartApiImpl extends AddToCartApi {
  @override
  Future getAddToCartApi(int productId, int quantity) async {
    Map<String, dynamic> map = Map<String, dynamic>();
    Map<String, String> mapToken = Map<String, String>();
    map.putIfAbsent("product_id", () => productId);
    map.putIfAbsent("quantity", () => quantity);
    mapToken.putIfAbsent("access_token", () => MemoryManagement.getAccessToken()!);
    Completer<dynamic> completer = new Completer<dynamic>();
    FormData formData = new FormData.fromMap(map);
    // print("getmap=>${map}");
    // print("getform=>${formData}");

    var response = await APIHandler.post(
      url: "${APIs.addToCart}",
      requestBody: formData,
      additionalHeaders: mapToken,

    );

    print('gotCartResponseeeee=>${response.runtimeType}');

    if (response is ApiError) {
      completer.complete(response);
      return completer.future;
    } else {
      completer.complete(response);
      return completer.future;
    }
  }
}
