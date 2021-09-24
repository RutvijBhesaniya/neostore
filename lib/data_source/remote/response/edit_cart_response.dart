import 'package:neostore/data/api/entity/edit_cart_entity.dart';
import 'package:neostore/data_source/remote/response/rest_response.dart';

class EditCartResponse extends RestResponse<EditCartEntity>{
  EditCartResponse(dynamic dataArray) {
    parseResponseData(dataArray);
  }

  parseResponseData(dynamic dataArray) {
    var response = EditCartEntity.fromJson(dataArray);
    getData().add(response);
  }
}