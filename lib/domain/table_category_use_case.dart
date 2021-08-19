import 'package:neostore/base/Base_use_case.dart';
import 'package:neostore/data/web_service/repository/table_category_repository/table_category_repository.dart';

class TableCategoryUseCase extends BaseUseCase<dynamic> {
  late TableCategoryRepository _tableCategoryRepository;

  TableCategoryUseCase(TableCategoryRepository tableCategoryRepository) {
    this._tableCategoryRepository = tableCategoryRepository;
  }

  @override
  Future callApi([productCategoryId]) {
    print("got product category id: " + productCategoryId.toString());
    return _tableCategoryRepository.getTableCategoryRepository(productCategoryId);
  }
}
