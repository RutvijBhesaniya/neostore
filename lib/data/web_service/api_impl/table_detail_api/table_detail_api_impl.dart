import 'dart:async';

import 'package:neostore/data/request/table_detail_api_request.dart';
import 'package:neostore/data/web_service/api_impl/table_detail_api/table_detail_api.dart';

class TableDetailApiImpl extends TableDetailApi {
  final TableDetailApiRequest _tableDetailApiRequest;

  TableDetailApiImpl(this._tableDetailApiRequest);

  @override
  Future getTableDetailApi(int productId) {
    return _tableDetailApiRequest.getTableDetailApi(productId);
  }
}
