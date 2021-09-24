import 'package:neostore/data/api/entity/add_to_cart_entity.dart';
import 'package:neostore/data_source/remote/response/rest_response.dart';

class AddToCartResponse extends RestResponse<AddToCartEntity>{
  AddToCartResponse(dynamic dataArray) {
    parseResponseData(dataArray);
  }

  parseResponseData(dynamic dataArray) {
    var response = AddToCartEntity.fromJson(dataArray);
    getData().add(response);
  }
}