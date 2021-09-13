import 'dart:async';

import 'package:neostore/data/request/order_address_list_api_request.dart';
import 'package:neostore/data/web_service/api_impl/order_address_api/order_address_api.dart';

class OrderAddressApiImpl extends OrderAddressApi {
  final OrderAddressListApiRequest _addressListApiRequest;

  OrderAddressApiImpl(this._addressListApiRequest);

  @override
  Future getOrderAddressApi(String address) {
   return _addressListApiRequest.getOrderAddressApi(address);
  }
}
