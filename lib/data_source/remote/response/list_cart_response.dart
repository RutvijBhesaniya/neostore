import 'package:neostore/data/api/entity/list_cart_entity.dart';
import 'package:neostore/data_source/remote/response/rest_response.dart';

class ListCartResponse extends RestResponse<ListCartEntity>{
  ListCartResponse(dynamic dataArray) {
    parseResponseData(dataArray);
  }

  parseResponseData(dynamic dataArray) {
    var response = ListCartEntity.fromJson(dataArray);
    getData().add(response);
  }
}