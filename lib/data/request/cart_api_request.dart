import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:neostore/base/network_model/api_constant.dart';
import 'package:neostore/base/network_model/api_error.dart';
import 'package:neostore/base/network_model/api_handler.dart';
import 'package:neostore/data_source/remote/response/list_cart_response.dart';
import 'package:neostore/domain/model/list_cart.dart';
import 'package:neostore/utils/shared_preferences/memory_management.dart';

class CartApiRequest{
  Future<Either<ListCart,ApiError>> getCartApi() async {
    Map<String, String> map = Map<String, String>();
    map.putIfAbsent("access_token", () => MemoryManagement.getAccessToken()!);

    // Completer<dynamic> completer = new Completer<dynamic>();

    Response response = await APIHandler.get(
      url: "${APIs.listCart}",
      additionalHeaders: map,
    );
    if(response.statusCode == 200){
      var listCartResponse = ListCartResponse(jsonDecode(response.data));
      return Left(listCartResponse.getData().first.mapToDomain());
    }else{
      var res = json.decode(response.data);
      return Right(ApiError(message: res['message']));
    }

  }

}