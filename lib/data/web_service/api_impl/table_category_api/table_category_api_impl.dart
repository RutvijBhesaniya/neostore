import 'dart:async';
import 'package:neostore/data/request/table_category_api_request.dart';
import 'package:neostore/data/web_service/api_impl/table_category_api/table_category_api.dart';

class TableCategoryApiImpl implements TableCategoryApi {
  final TableCategoryApiRequest _tableCategoryApiRequest;
  TableCategoryApiImpl(this._tableCategoryApiRequest);

  @override
  Future getTableCategoryApi(int categoryId) {
    return _tableCategoryApiRequest.getTableCategoryApi(categoryId);
  }

}
