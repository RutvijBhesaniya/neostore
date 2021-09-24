import 'dart:async';

import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:neostore/base/network_model/api_constant.dart';
import 'package:neostore/base/network_model/api_error.dart';
import 'package:neostore/base/network_model/api_handler.dart';
import 'package:neostore/data/request/delete_cart_api_request.dart';
import 'package:neostore/data/web_service/api_impl/delete_cart_api/delete_cart_api.dart';
import 'package:neostore/domain/model/delete_cart.dart';
import 'package:neostore/utils/shared_preferences/memory_management.dart';

class DeleteCartApiImpl extends DeleteCartApi {
  final DeleteCartApiRequest deleteCartApiRequest;

  DeleteCartApiImpl(this.deleteCartApiRequest);

  @override
  Future<Either<DeleteCart, ApiError>> getDeleteCartApi(int productId) {
    return deleteCartApiRequest.getDeleteCartApi(productId);
  }
}
