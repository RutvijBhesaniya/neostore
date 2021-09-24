import 'package:either_dart/either.dart';
import 'package:neostore/base/network_model/api_error.dart';
import 'package:neostore/domain/model/order_list.dart';

abstract class MyOrderListRepository {
  Future<Either<OrderList,ApiError>> getOrderListRepository();
}
