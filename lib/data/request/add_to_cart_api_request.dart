import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:neostore/base/network_model/api_constant.dart';
import 'package:neostore/base/network_model/api_error.dart';
import 'package:neostore/base/network_model/api_handler.dart';
import 'package:neostore/data_source/remote/response/add_to_cart_response.dart';
import 'package:neostore/domain/model/add_to_cart.dart';
import 'package:neostore/utils/shared_preferences/memory_management.dart';

class AddToCartApiRequest {
  Future<Either<AddToCart, ApiError>> getAddToCartApi(
      int productId, int quantity) async {
    Map<String, dynamic> map = Map<String, dynamic>();
    Map<String, String> mapToken = Map<String, String>();
    map.putIfAbsent("product_id", () => productId);
    map.putIfAbsent("quantity", () => quantity);
    mapToken.putIfAbsent(
        "access_token", () => MemoryManagement.getAccessToken()!);
    // Completer<dynamic> completer = new Completer<dynamic>();
    FormData formData = new FormData.fromMap(map);

    Response response = await APIHandler.post(
      url: "${APIs.addToCart}",
      requestBody: formData,
      additionalHeaders: mapToken,
    );

    if (response.statusCode == 200) {
      var addToCartResponse = AddToCartResponse(jsonDecode(response.data));
      return Left(addToCartResponse.getData().first.mapToDomain());
    } else {
      var res = json.decode(response.data);
      return Right(ApiError(message: res['message']));
    }
  }
}
