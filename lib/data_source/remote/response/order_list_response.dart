import 'package:neostore/data/api/entity/order_list_entity.dart';
import 'package:neostore/data_source/remote/response/rest_response.dart';

class OrderListResponse extends RestResponse<OrderListEntity>{
  OrderListResponse(dynamic dataArray) {
    parseResponseData(dataArray);
  }

  parseResponseData(dynamic dataArray) {
    var response = OrderListEntity.fromJson(dataArray);
    getData().add(response);
  }
}