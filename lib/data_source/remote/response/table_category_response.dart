import 'package:neostore/data/api/entity/table_category_entity.dart';
import 'package:neostore/data_source/remote/response/rest_response.dart';

class TableCategoryResponse extends RestResponse<TableCategoryEntity>{
  TableCategoryResponse(dynamic dataArray) {
    parseResponseData(dataArray);
  }

  parseResponseData(dynamic dataArray) {
    var response = TableCategoryEntity.fromJson(dataArray);
    getData().add(response);
  }
}