import 'dart:async';
import 'package:either_dart/either.dart';
import 'package:neostore/base/network_model/api_error.dart';
import 'package:neostore/data/request/table_category_api_request.dart';
import 'package:neostore/data/web_service/api_impl/table_category_api/table_category_api.dart';
import 'package:neostore/domain/model/table_category.dart';

class TableCategoryApiImpl implements TableCategoryApi {
  final TableCategoryApiRequest _tableCategoryApiRequest;
  TableCategoryApiImpl(this._tableCategoryApiRequest);

  @override
  Future<Either<TableCategory,ApiError>> getTableCategoryApi(int categoryId) {
    return _tableCategoryApiRequest.getTableCategoryApi(categoryId);
  }

}
