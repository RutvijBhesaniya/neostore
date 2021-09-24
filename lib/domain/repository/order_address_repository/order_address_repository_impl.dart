import 'package:either_dart/either.dart';
import 'package:neostore/base/network_model/api_error.dart';
import 'package:neostore/data/web_service/api_impl/order_address_api/order_address_api.dart';
import 'package:neostore/domain/model/order_address.dart';
import 'package:neostore/domain/repository/order_address_repository/order_address_repository.dart';

class OrderAddressRepositoryImpl implements OrderAddressRepository {
  late OrderAddressApi _orderAddressApi;

  OrderAddressRepositoryImpl(OrderAddressApi _orderAddressApi) {
    this._orderAddressApi = _orderAddressApi;
  }

  @override
  Future<Either<OrderAddress,ApiError>> getOrderAddressRepository(String address) {
    return _orderAddressApi.getOrderAddressApi(address);
  }
}
