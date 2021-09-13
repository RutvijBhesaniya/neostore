import 'package:neostore/base/base_use_case.dart';
import 'package:neostore/domain/repository/order_address_repository/order_address_repository.dart';

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
