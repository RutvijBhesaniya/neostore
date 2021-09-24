import 'package:neostore/data/api/entity/my_account_entity.dart';
import 'package:neostore/data_source/remote/response/rest_response.dart';

class MyAccountResponse extends RestResponse<MyAccountEntity>{
  MyAccountResponse(dynamic dataArray) {
    parseResponseData(dataArray);
  }

  parseResponseData(dynamic dataArray) {
    var response = MyAccountEntity.fromJson(dataArray);
    getData().add(response);
  }
}