import 'package:neostore/base/base_use_case.dart';
import 'package:neostore/domain/repository/table_detail_repository/table_detail_repository.dart';

class TableDetailUseCase extends BaseUseCase<dynamic> {
  late TableDetailRepository _tableDetailRepository;

  TableDetailUseCase(TableDetailRepository tableDetailRepository) {
    this._tableDetailRepository = tableDetailRepository;
  }

  @override
  Future callApi([productId]) {
    return _tableDetailRepository.getTableDetailRepository(productId);
  }
}
