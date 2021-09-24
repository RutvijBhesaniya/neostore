import 'package:either_dart/either.dart';
import 'package:neostore/base/network_model/api_error.dart';
import 'package:neostore/domain/model/table_detail.dart';

abstract class TableDetailRepository{
  Future<Either<TableDetail,ApiError>> getTableDetailRepository(int productId);

}