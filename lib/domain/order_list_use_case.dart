import 'package:neostore/base/base_use_case.dart';
import 'package:neostore/data/web_service/repository/my_order_list_repository/my_order_list_repository.dart';

class MyOrderListUseCase extends BaseUseCase<dynamic> {
  MyOrderListRepository? _orderListRepository;

  MyOrderListUseCase(MyOrderListRepository orderListRepository) {
    this._orderListRepository = orderListRepository;
  }

  @override
  Future callApi() {
    return _orderListRepository!.getOrderListRepository();
  }
}
