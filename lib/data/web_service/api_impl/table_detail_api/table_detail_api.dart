import 'package:either_dart/either.dart';
import 'package:neostore/base/network_model/api_error.dart';
import 'package:neostore/domain/model/table_detail.dart';

abstract class TableDetailApi {
  Future<Either<TableDetail,ApiError>> getTableDetailApi(int productId);
}
