import 'package:either_dart/either.dart';
import 'package:neostore/base/network_model/api_error.dart';
import 'package:neostore/data/web_service/api_impl/my_order_list_api/my_order_list_api.dart';
import 'package:neostore/domain/model/order_list.dart';
import 'package:neostore/domain/repository/my_order_list_repository/my_order_list_repository.dart';

class MyOrderListRepositoryImpl implements MyOrderListRepository {
  late MyOrderListApi _orderListApi;

  MyOrderListRepositoryImpl(MyOrderListApi _orderListApi) {
    this._orderListApi = _orderListApi;
  }

  @override
  Future<Either<OrderList,ApiError>> getOrderListRepository()  {
    return _orderListApi.getOrderListApi();
  }
}
