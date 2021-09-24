import 'package:neostore/data/api/entity/forgot_password_entity.dart';
import 'package:neostore/data_source/remote/response/rest_response.dart';

class ForgotPasswordResponse extends RestResponse<ForgotPasswordEntity>{
  ForgotPasswordResponse(dynamic dataArray) {
    parseResponseData(dataArray);
  }

  parseResponseData(dynamic dataArray) {
    var response = ForgotPasswordEntity.fromJson(dataArray);
    getData().add(response);
  }
}