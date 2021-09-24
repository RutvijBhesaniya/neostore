import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:neostore/base/network_model/api_constant.dart';
import 'package:neostore/base/network_model/api_error.dart';
import 'package:neostore/base/network_model/api_handler.dart';
import 'package:neostore/data_source/remote/response/delete_cart_response.dart';
import 'package:neostore/domain/model/delete_cart.dart';
import 'package:neostore/utils/shared_preferences/memory_management.dart';

class DeleteCartApiRequest {
  Future<Either<DeleteCart, ApiError>> getDeleteCartApi(int productId) async {
    Map<String, dynamic> map = Map<String, dynamic>();
    Map<String, String> mapToken = Map<String, String>();
    map.putIfAbsent("product_id", () => productId);
    mapToken.putIfAbsent(
        "access_token", () => MemoryManagement.getAccessToken()!);
    FormData formData = new FormData.fromMap(map);

    Response response = await APIHandler.post(
      url: "${APIs.deleteCart}",
      additionalHeaders: mapToken,
      requestBody: formData,
    );

    if (response.statusCode == 200) {
      var deleteCartResponse = DeleteCartResponse(jsonDecode(response.data));
      return Left(deleteCartResponse.getData().first.mapToDomain());
    } else {
      var res = json.decode(response.data);
      return Right(ApiError(message: res['message']));
    }
  }


}
