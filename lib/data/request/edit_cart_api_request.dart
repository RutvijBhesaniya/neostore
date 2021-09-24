import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:neostore/base/network_model/api_constant.dart';
import 'package:neostore/base/network_model/api_error.dart';
import 'package:neostore/base/network_model/api_handler.dart';
import 'package:neostore/data_source/remote/response/edit_cart_response.dart';
import 'package:neostore/domain/model/edit_cart.dart';
import 'package:neostore/utils/shared_preferences/memory_management.dart';

class EditCartApiRequest{
  Future<Either<EditCart,ApiError>> getEditCartApi(int productId, int quantity) async {
    Map<String, dynamic> map = Map<String, dynamic>();
    Map<String, String> mapToken = Map<String, String>();

    map.putIfAbsent("product_id", () => productId);
    map.putIfAbsent("quantity", () => quantity);
    mapToken.putIfAbsent(
        "access_token", () => MemoryManagement.getAccessToken()!);
    FormData formData = new FormData.fromMap(map);

    Response response = await APIHandler.post(
      url: "${APIs.editCart}",
      requestBody: formData,
      additionalHeaders: mapToken,
    );

    if(response.statusCode == 200){
      var editCartResponse =EditCartResponse(jsonDecode(response.data));
      return Left(editCartResponse.getData().first.mapToDomain());

    }else{
      var res = json.decode(response.data);
      return Right(ApiError(message: res['message']));
    }
  }

}