import 'package:either_dart/either.dart';
import 'package:neostore/base/network_model/api_error.dart';
import 'package:neostore/domain/model/table_category.dart';

abstract class TableCategoryRepository {
  Future<Either<TableCategory,ApiError>> getTableCategoryRepository(int productCategoryId);
}
