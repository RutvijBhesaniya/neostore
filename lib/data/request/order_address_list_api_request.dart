import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:neostore/base/network_model/api_constant.dart';
import 'package:neostore/base/network_model/api_error.dart';
import 'package:neostore/base/network_model/api_handler.dart';
import 'package:neostore/data_source/remote/response/order_address_response.dart';
import 'package:neostore/domain/model/order_address.dart';
import 'package:neostore/utils/shared_preferences/memory_management.dart';

class OrderAddressListApiRequest {
  Future<Either<OrderAddress, ApiError>> getOrderAddressApi(
      String address) async {
    Map<String, dynamic> map = Map<String, dynamic>();
    Map<String, String> mapToken = Map<String, String>();
    mapToken.putIfAbsent(
        "access_token", () => MemoryManagement.getAccessToken()!);
    map.putIfAbsent("address", () => address);
    // Completer<dynamic> completer = new Completer<dynamic>();
    FormData formData = new FormData.fromMap(map);

    Response response = await APIHandler.post(
      url: "${APIs.orderAddress}",
      requestBody: formData,
      additionalHeaders: mapToken,
    );

    if (response.statusCode == 200) {
      var orderAddressResponse =
          OrderAddressResponse(jsonDecode(response.data));
      return Left(orderAddressResponse.getData().first.mapToDomain());
    } else {
      return Right(ApiError(message: response.statusMessage));
    }
  }
}
