import 'package:either_dart/either.dart';
import 'package:neostore/base/network_model/api_error.dart';
import 'package:neostore/data/web_service/api_impl/order_detail_api/order_detail_api.dart';
import 'package:neostore/domain/model/order_detail.dart';
import 'package:neostore/domain/repository/order_detail_repository/order_detail_repository.dart';

class OrderDetailRepositoryImpl implements OrderDetailRepository {
  late OrderDetailApi _orderDetailApi;

  OrderDetailRepositoryImpl(OrderDetailApi _orderDetailApi) {
    this._orderDetailApi = _orderDetailApi;
  }

  @override
  Future<Either<OrderDetail, ApiError>> getOrderDetailRepository(int orderId) {
    return _orderDetailApi.getOrderDetailApi(orderId);
  }
}
