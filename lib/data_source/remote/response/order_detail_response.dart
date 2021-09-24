import 'package:neostore/data/api/entity/order_detail_entity.dart';
import 'package:neostore/data_source/remote/response/rest_response.dart';

class OrderDetailResponse extends RestResponse<OrderDetailEntity>{
  OrderDetailResponse(dynamic dataArray) {
    parseResponseData(dataArray);
  }

  parseResponseData(dynamic dataArray) {
    var response = OrderDetailEntity.fromJson(dataArray);
    getData().add(response);
  }
}