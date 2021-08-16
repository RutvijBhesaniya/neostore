import 'package:flutter/src/widgets/framework.dart';
import 'package:neostore/data/model/response/table_category_response.dart';
import 'package:neostore/data/web_service/api_impl/table_category_api/table_category_api.dart';
import 'package:neostore/data/web_service/repository/table_category/table_category_repository.dart';

class TableCategoryRepositoryImpl extends TableCategoryRepository {
  late TableCategoryApi _tableCategoryApi;

  TableCategoryRepositoryImpl(this._tableCategoryApi);

  @override
  Future getTableCategoryRepository(
      TableCategoryResponse tableCategoryResponse, BuildContext context) {
    return _tableCategoryApi.getTableCategoryApi(tableCategoryResponse, context);

  }
}
