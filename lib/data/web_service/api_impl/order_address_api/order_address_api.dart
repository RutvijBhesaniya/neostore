import 'package:either_dart/either.dart';
import 'package:neostore/base/network_model/api_error.dart';
import 'package:neostore/domain/model/order_address.dart';

abstract class OrderAddressApi {
  Future<Either<OrderAddress,ApiError>> getOrderAddressApi(String address);
}
