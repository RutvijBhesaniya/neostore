import 'package:neostore/data/api/entity/register_entity.dart';
import 'package:neostore/data_source/remote/response/rest_response.dart';

class RegisterResponse extends RestResponse<RegisterEntity>{
  RegisterResponse(dynamic dataArray) {
    parseResponseData(dataArray);
  }

  parseResponseData(dynamic dataArray) {
    var response = RegisterEntity.fromJson(dataArray);
    getData().add(response);
  }
}