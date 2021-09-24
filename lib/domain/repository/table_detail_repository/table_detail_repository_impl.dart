import 'package:either_dart/either.dart';
import 'package:neostore/base/network_model/api_error.dart';
import 'package:neostore/data/web_service/api_impl/table_detail_api/table_detail_api.dart';
import 'package:neostore/domain/model/table_detail.dart';
import 'package:neostore/domain/repository/table_detail_repository/table_detail_repository.dart';

class TableDetailRepositoryImpl extends TableDetailRepository {
  late TableDetailApi _tableDetailApi;

  TableDetailRepositoryImpl(TableDetailApi _tableDetailApi){
    this._tableDetailApi =_tableDetailApi;
  }

  @override
  Future<Either<TableDetail,ApiError>> getTableDetailRepository(int productId) {
    return _tableDetailApi.getTableDetailApi(productId);
  }
}
