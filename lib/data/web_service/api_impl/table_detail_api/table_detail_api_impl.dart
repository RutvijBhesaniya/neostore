import 'dart:async';

import 'package:either_dart/either.dart';
import 'package:neostore/base/network_model/api_error.dart';
import 'package:neostore/data/request/table_detail_api_request.dart';
import 'package:neostore/data/web_service/api_impl/table_detail_api/table_detail_api.dart';
import 'package:neostore/domain/model/table_detail.dart';

class TableDetailApiImpl extends TableDetailApi {
  final TableDetailApiRequest _tableDetailApiRequest;

  TableDetailApiImpl(this._tableDetailApiRequest);

  @override
  Future<Either<TableDetail,ApiError>> getTableDetailApi(int productId) {
    return _tableDetailApiRequest.getTableDetailApi(productId);
  }
}
