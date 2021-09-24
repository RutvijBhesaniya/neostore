import 'dart:async';
import 'dart:convert';

import 'package:either_dart/either.dart';
import 'package:neostore/base/network_model/api_constant.dart';
import 'package:neostore/base/network_model/api_error.dart';
import 'package:neostore/base/network_model/api_handler.dart';
import 'package:neostore/data_source/remote/response/table_category_response.dart';
import 'package:neostore/domain/model/table_category.dart';

class TableCategoryApiRequest {
  Future<Either<TableCategory, ApiError>> getTableCategoryApi(
      int categoryId) async {
    var response = await APIHandler.get(
      url: "${APIs.tableCategory}",
      requestBody: {"product_category_id": categoryId},
    );

    if (response.statusCode == 200) {
      var tableCategoryResponse =
          TableCategoryResponse(jsonDecode(response.data));
      return Left(tableCategoryResponse.getData().first.mapToDomain());
    } else {
      return Right(ApiError(message: response.statusMessage));
    }
  }
}
