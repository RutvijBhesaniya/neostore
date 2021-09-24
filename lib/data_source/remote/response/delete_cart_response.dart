import 'package:neostore/data/api/entity/delete_cart_entity.dart';
import 'package:neostore/data_source/remote/response/rest_response.dart';

class DeleteCartResponse extends RestResponse<DeleteCartEntity>{
  DeleteCartResponse(dynamic dataArray) {
    parseResponseData(dataArray);
  }

  parseResponseData(dynamic dataArray) {
    var response = DeleteCartEntity.fromJson(dataArray);
    getData().add(response);
  }
}