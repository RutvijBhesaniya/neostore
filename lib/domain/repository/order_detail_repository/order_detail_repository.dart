import 'package:either_dart/either.dart';
import 'package:neostore/base/network_model/api_error.dart';
import 'package:neostore/domain/model/order_detail.dart';

abstract class OrderDetailRepository {
  Future<Either<OrderDetail, ApiError>> getOrderDetailRepository(int orderId);
}
