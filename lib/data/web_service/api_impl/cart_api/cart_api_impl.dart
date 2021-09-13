import 'dart:async';

import 'package:neostore/data/request/cart_api_request.dart';
import 'package:neostore/data/web_service/api_impl/cart_api/cart_api.dart';

class CartApiImpl extends CartApi {

  final CartApiRequest cartApiRequest;

  CartApiImpl(this.cartApiRequest);

  @override
  Future getCartApi() {
    return cartApiRequest.getCartApi();
  }
}
