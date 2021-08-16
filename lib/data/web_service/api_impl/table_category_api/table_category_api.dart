import 'package:flutter/cupertino.dart';
import 'package:neostore/data/model/response/table_category_response.dart';

abstract class TableCategoryApi {
  Future<dynamic> getTableCategoryApi(
      TableCategoryResponse tableCategoryResponse, BuildContext context,);
}