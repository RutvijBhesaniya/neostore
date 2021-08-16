import 'package:neostore/base/Base_use_case.dart';
import 'package:neostore/data/web_service/repository/table_category/table_category_repository.dart';

class TableCategoryUseCase extends BaseUseCase<dynamic> {
  late TableCategoryRepository _tableCategoryRepository;

  TableCategoryUseCase(this._tableCategoryRepository);

  @override
  Future callApi([tableCategoryResponse, context]) {
    return _tableCategoryRepository
        .getTableCategoryRepository(tableCategoryResponse, context)
        .then(
          (value) => print("tableCategory=>$value"),
        );
  }
}
