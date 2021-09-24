import 'package:neostore/data/api/entity/rating_entity.dart';
import 'package:neostore/data_source/remote/response/rest_response.dart';

class RatingResponse extends RestResponse<RatingEntity>{
  RatingResponse(dynamic dataArray) {
    parseResponseData(dataArray);
  }

  parseResponseData(dynamic dataArray) {
    var response = RatingEntity.fromJson(dataArray);
    getData().add(response);
  }
}