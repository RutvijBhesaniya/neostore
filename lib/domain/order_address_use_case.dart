import 'package:neostore/base/Base_use_case.dart';
import 'package:neostore/data/web_service/repository/order_address_repository/order_address_repository.dart';

class OrderAddressUseCase extends BaseUseCase<dynamic> {
  late OrderAddressRepository _orderAddressRepository;

  OrderAddressUseCase(OrderAddressRepository orderAddressRepository) {
    this._orderAddressRepository = orderAddressRepository;
  }

  @override
  Future callApi([address]) {
    return _orderAddressRepository.getOrderAddressRepository(
        address);
  }
}
