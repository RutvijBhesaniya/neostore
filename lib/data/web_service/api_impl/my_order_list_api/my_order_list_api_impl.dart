import 'package:neostore/data/request/my_order_list_api_request.dart';
import 'package:neostore/data/web_service/api_impl/my_order_list_api/my_order_list_api.dart';

class MyOrderListApiImpl extends MyOrderListApi {
  MyOrderListApiImpl(this._myOrderListApiRequest);

  final MyOrderListApiRequest _myOrderListApiRequest;

  @override
  Future getOrderListApi() {
    return _myOrderListApiRequest.getOrderListApi();
  }
}
