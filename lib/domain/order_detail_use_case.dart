import 'package:neostore/base/base_use_case.dart';
import 'package:neostore/data/web_service/repository/order_detail_repository/order_detail_repository.dart';

class OrderDetailUseCase extends BaseUseCase<dynamic> {
  late OrderDetailRepository _orderDetailRepository;

  OrderDetailUseCase(OrderDetailRepository orderDetailRepository) {
    this._orderDetailRepository = orderDetailRepository;
  }

  @override
  Future callApi([orderId]) {
    return _orderDetailRepository.getOrderDetailRepository(orderId);
  }
}
