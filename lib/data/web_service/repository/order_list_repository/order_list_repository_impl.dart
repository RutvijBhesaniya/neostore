import 'package:neostore/data/web_service/api_impl/order_list_api/order_list_api.dart';
import 'package:neostore/data/web_service/repository/order_list_repository/order_list_repository.dart';

class OrderListRepositoryImpl implements OrderListRepository {
  late OrderListApi _orderListApi;

  OrderListRepositoryImpl(OrderListApi _orderListApi) {
    this._orderListApi = _orderListApi;
  }

  @override
  Future getOrderListRepository() {
    return _orderListApi.getOrderListApi();
  }
}
