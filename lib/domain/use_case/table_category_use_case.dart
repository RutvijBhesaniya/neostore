import 'package:either_dart/either.dart';
import 'package:neostore/base/base_use_case.dart';
import 'package:neostore/base/network_model/api_error.dart';
import 'package:neostore/domain/model/table_category.dart';
import 'package:neostore/domain/repository/table_category_repository/table_category_repository.dart';
import 'package:neostore/presentation/model/table_category_item.dart';

class TableCategoryUseCase extends BaseUseCase<dynamic> {
  late TableCategoryRepository _tableCategoryRepository;

  TableCategoryUseCase(TableCategoryRepository tableCategoryRepository) {
    this._tableCategoryRepository = tableCategoryRepository;
  }

  @override
  Future<Either<TableCategoryItem, ApiError>> callApi([productCategoryId]) {
    print("got product category id: " + productCategoryId.toString());
    return _tableCategoryRepository
        .getTableCategoryRepository(productCategoryId)
        .then((value) {
      if (value.isLeft) {
        return Left(value.left.mapToPresentation());
      } else {
        return Right(value.right);
      }
    });
  }
}
