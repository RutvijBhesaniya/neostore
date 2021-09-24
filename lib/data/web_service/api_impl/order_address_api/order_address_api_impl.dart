import 'dart:async';

import 'package:either_dart/either.dart';
import 'package:neostore/base/network_model/api_error.dart';
import 'package:neostore/data/request/order_address_list_api_request.dart';
import 'package:neostore/data/web_service/api_impl/order_address_api/order_address_api.dart';
import 'package:neostore/domain/model/order_address.dart';

class OrderAddressApiImpl extends OrderAddressApi {
  final OrderAddressListApiRequest _addressListApiRequest;

  OrderAddressApiImpl(this._addressListApiRequest);

  @override
  Future<Either<OrderAddress,ApiError>> getOrderAddressApi(String address) {
   return _addressListApiRequest.getOrderAddressApi(address);
  }
}
