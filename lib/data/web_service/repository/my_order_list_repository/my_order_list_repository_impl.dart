import 'package:neostore/data/web_service/api_impl/my_order_list_api/my_order_list_api.dart';
import 'package:neostore/data/web_service/repository/my_order_list_repository/my_order_list_repository.dart';

class MyOrderListRepositoryImpl implements MyOrderListRepository {
  late MyOrderListApi _orderListApi;

  MyOrderListRepositoryImpl(MyOrderListApi _orderListApi) {
    this._orderListApi = _orderListApi;
  }

  @override
  Future getOrderListRepository() {
    return _orderListApi.getOrderListApi();
  }
}
