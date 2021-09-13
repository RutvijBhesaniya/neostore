import 'dart:async';

import 'package:dio/dio.dart';
import 'package:neostore/base/network_model/api_constant.dart';
import 'package:neostore/base/network_model/api_error.dart';
import 'package:neostore/base/network_model/api_handler.dart';
import 'package:neostore/data/request/order_address_list_api_request.dart';
import 'package:neostore/data/request/order_detail_api_request.dart';
import 'package:neostore/data/web_service/api_impl/order_address_api/order_address_api.dart';
import 'package:neostore/utils/shared_preferences/memory_management.dart';

class OrderAddressApiImpl extends OrderAddressApi {
  final OrderAddressListApiRequest _addressListApiRequest;

  OrderAddressApiImpl(this._addressListApiRequest);

  @override
  Future getOrderAddressApi(String address) {
   return _addressListApiRequest.getOrderAddressApi(address);
  }
}
