import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:neostore/base/network_model/api_constant.dart';
import 'package:neostore/base/network_model/api_error.dart';
import 'package:neostore/base/network_model/api_handler.dart';
import 'package:neostore/data_source/remote/response/order_list_response.dart';
import 'package:neostore/domain/model/order_list.dart';
import 'package:neostore/utils/shared_preferences/memory_management.dart';

class MyOrderListApiRequest {
  Future<Either<OrderList, ApiError>> getOrderListApi() async {
    Map<String, String> mapToken = Map<String, String>();
    mapToken.putIfAbsent(
        "access_token", () => MemoryManagement.getAccessToken()!);
    // Completer<dynamic> completer = new Completer<dynamic>();

    Response response = await APIHandler.get(
      url: "${APIs.orderList}",
      additionalHeaders: mapToken,
    );

    if (response.statusCode == 200) {
      var orderListResponse = OrderListResponse(jsonDecode(response.data));
      return Left(orderListResponse.getData().first.mapToDomain());
    } else {
      return Right(ApiError(message: response.statusMessage));
    }
    // if (response is ApiError) {
    //   completer.complete(response);
    //   return completer.future;
    // } else {
    //   completer.complete(response);
    //   return completer.future;
    // }
  }
}
