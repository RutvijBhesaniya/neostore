import 'dart:async';
import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:neostore/base/network_model/api_constant.dart';
import 'package:neostore/base/network_model/api_error.dart';
import 'package:neostore/base/network_model/api_handler.dart';
import 'package:neostore/data/request/add_to_cart_api_request.dart';
import 'package:neostore/data/web_service/api_impl/add_to_cart_api/add_to_cart_api.dart';
import 'package:neostore/domain/model/add_to_cart.dart';
import 'package:neostore/utils/shared_preferences/memory_management.dart';

class AddToCartApiImpl extends AddToCartApi {
  final AddToCartApiRequest _addToCartApiRequest;

  AddToCartApiImpl(this._addToCartApiRequest);

  @override
  Future<Either<AddToCart, ApiError>> getAddToCartApi(int productId, int quantity) {
   return _addToCartApiRequest.getAddToCartApi(productId, quantity);
  }
}
