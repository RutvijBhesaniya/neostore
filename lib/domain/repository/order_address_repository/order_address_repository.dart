import 'package:either_dart/either.dart';
import 'package:neostore/base/network_model/api_error.dart';
import 'package:neostore/domain/model/order_address.dart';

abstract class OrderAddressRepository {
  Future<Either<OrderAddress,ApiError>>  getOrderAddressRepository(String address);
}
