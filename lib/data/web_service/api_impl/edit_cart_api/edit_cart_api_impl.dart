import 'dart:async';
import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:neostore/base/network_model/api_constant.dart';
import 'package:neostore/base/network_model/api_error.dart';
import 'package:neostore/base/network_model/api_handler.dart';
import 'package:neostore/data/request/edit_cart_api_request.dart';
import 'package:neostore/data/web_service/api_impl/edit_cart_api/edit_cart_api.dart';
import 'package:neostore/domain/model/edit_cart.dart';
import 'package:neostore/utils/shared_preferences/memory_management.dart';

class EditCartApiImpl extends EditCartApi {
  final EditCartApiRequest editCartApiRequest;

  EditCartApiImpl(this.editCartApiRequest);

  @override
  Future<Either<EditCart,ApiError>> getEditCartApi(int productId, int quantity) {
    return editCartApiRequest.getEditCartApi(productId, quantity);
  }
}
