import 'dart:async';

import 'package:either_dart/either.dart';
import 'package:neostore/base/network_model/api_error.dart';
import 'package:neostore/data/request/cart_api_request.dart';
import 'package:neostore/data/web_service/api_impl/cart_api/cart_api.dart';
import 'package:neostore/domain/model/list_cart.dart';

class CartApiImpl extends CartApi {

  final CartApiRequest cartApiRequest;

  CartApiImpl(this.cartApiRequest);

  @override
  Future<Either<ListCart,ApiError>> getCartApi() {
    return cartApiRequest.getCartApi();
  }
}
