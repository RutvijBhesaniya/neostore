import 'package:neostore/base/Base_use_case.dart';
import 'package:neostore/data/web_service/repository/order_detail_repository/order_detail_repository.dart';

class OrderDetailUseCase extends BaseUseCase<dynamic> {
  late OrderDetailRepository _orderDetailRepository;

  OrderDetailUseCase(OrderDetailRepository orderDetailRepository) {
    this._orderDetailRepository = orderDetailRepository;
  }

  @override
  Future callApi([productId]) {
    return _orderDetailRepository.getOrderDetailRepository(productId);
  }
}
