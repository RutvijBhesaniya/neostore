import 'package:neostore/base/Base_use_case.dart';
import 'package:neostore/data/web_service/repository/order_list_repository/order_list_repository.dart';

class OrderListUseCase extends BaseUseCase<dynamic> {
  late OrderListRepository _orderListRepository;

  OrderListUseCase(OrderListRepository orderListRepository) {
    this._orderListRepository = orderListRepository;
  }

  @override
  Future callApi() {
    return _orderListRepository.getOrderListRepository();
  }
}
