import 'package:neostore/data/api/entity/table_detail_entity.dart';
import 'package:neostore/data_source/remote/response/rest_response.dart';

class TableDetailResponse extends RestResponse<TableDetailEntity>{
  TableDetailResponse(dynamic dataArray) {
    parseResponseData(dataArray);
  }

  parseResponseData(dynamic dataArray) {
    var response = TableDetailEntity.fromJson(dataArray);
    getData().add(response);
  }
}