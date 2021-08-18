import 'package:flutter/cupertino.dart';
import 'package:neostore/data/model/response/table_category_response.dart';

abstract class TableCategoryRepository {
  Future<dynamic> getTableCategoryRepository(int productCategoryId);
}
