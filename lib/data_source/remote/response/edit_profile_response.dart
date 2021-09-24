import 'package:neostore/data/api/entity/edit_profile_entity.dart';
import 'package:neostore/data_source/remote/response/rest_response.dart';

class EditProfileResponse extends RestResponse<EditProfileEntity>{
  EditProfileResponse(dynamic dataArray) {
    parseResponseData(dataArray);
  }

  parseResponseData(dynamic dataArray) {
    var response = EditProfileEntity.fromJson(dataArray);
    getData().add(response);
  }
}