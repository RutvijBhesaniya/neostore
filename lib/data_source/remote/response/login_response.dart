
import 'package:neostore/data/api/entity/login_entity.dart';
import 'package:neostore/data_source/remote/response/rest_response.dart';

class LoginResponse extends RestResponse<LoginEntity>{
    LoginResponse(dynamic dataArray) {
      parseResponseData(dataArray);
  }

  parseResponseData(dynamic dataArray) {
    var response = LoginEntity.fromJson(dataArray);
    getData().add(response);
  }
}