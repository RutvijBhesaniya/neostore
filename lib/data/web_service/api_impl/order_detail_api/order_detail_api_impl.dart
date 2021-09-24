import 'dart:async';
import 'package:either_dart/either.dart';
import 'package:neostore/base/network_model/api_error.dart';
import 'package:neostore/data/request/order_detail_api_request.dart';
import 'package:neostore/data/web_service/api_impl/order_detail_api/order_detail_api.dart';
import 'package:neostore/domain/model/order_detail.dart';

class OrderDetailApiImpl extends OrderDetailApi {
  OrderDetailApiImpl(this._orderDetailApiRequest);

  final OrderDetailApiRequest _orderDetailApiRequest;

  @override
  Future<Either<OrderDetail, ApiError>> getOrderDetailApi(int orderId) {
    return _orderDetailApiRequest.getOrderDetailApi(orderId);
  }

}
