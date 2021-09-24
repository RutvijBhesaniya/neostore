import 'package:neostore/data/api/entity/order_address_entity.dart';
import 'package:neostore/data_source/remote/response/rest_response.dart';

class OrderAddressResponse extends RestResponse<OrderAddressEntity>{
  OrderAddressResponse(dynamic dataArray) {
    parseResponseData(dataArray);
  }

  parseResponseData(dynamic dataArray) {
    var response = OrderAddressEntity.fromJson(dataArray);
    getData().add(response);
  }
}