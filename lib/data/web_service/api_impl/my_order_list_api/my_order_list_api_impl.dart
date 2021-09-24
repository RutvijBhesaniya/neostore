import 'package:either_dart/either.dart';
import 'package:neostore/base/network_model/api_error.dart';
import 'package:neostore/data/request/my_order_list_api_request.dart';
import 'package:neostore/data/web_service/api_impl/my_order_list_api/my_order_list_api.dart';
import 'package:neostore/domain/model/order_list.dart';

class MyOrderListApiImpl extends MyOrderListApi {
  MyOrderListApiImpl(this._myOrderListApiRequest);

  final MyOrderListApiRequest _myOrderListApiRequest;

  @override
  Future<Either<OrderList,ApiError>> getOrderListApi() {
    return _myOrderListApiRequest.getOrderListApi();
  }
}
