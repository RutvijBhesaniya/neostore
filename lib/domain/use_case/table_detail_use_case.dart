import 'package:either_dart/either.dart';
import 'package:neostore/base/base_use_case.dart';
import 'package:neostore/base/network_model/api_error.dart';
import 'package:neostore/domain/repository/table_detail_repository/table_detail_repository.dart';
import 'package:neostore/presentation/model/table_detail_item.dart';

class TableDetailUseCase extends BaseUseCase<dynamic> {
  late TableDetailRepository _tableDetailRepository;

  TableDetailUseCase(TableDetailRepository tableDetailRepository) {
    this._tableDetailRepository = tableDetailRepository;
  }

  @override
  Future<Either<TableDetailItem,ApiError>> callApi([productId]) {
    return _tableDetailRepository.getTableDetailRepository(productId).then((value) {
      if (value.isLeft) {
        return Left(value.left.mapToPresentation());
      } else {
        return Right(value.right);
      }
    });
  }
}
