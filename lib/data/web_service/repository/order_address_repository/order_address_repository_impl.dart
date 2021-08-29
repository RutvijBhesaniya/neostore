import 'package:neostore/data/web_service/api_impl/order_address_api/order_address_api.dart';
import 'package:neostore/data/web_service/repository/order_address_repository/order_address_repository.dart';

class OrderAddressRepositoryImpl implements OrderAddressRepository {
  late OrderAddressApi _orderAddressApi;

  OrderAddressRepositoryImpl(OrderAddressApi _orderAddressApi) {
    this._orderAddressApi = _orderAddressApi;
  }

  @override
  Future getOrderAddressRepository(String address) {
    return _orderAddressApi.getOrderAddressApi(address);
  }
}
