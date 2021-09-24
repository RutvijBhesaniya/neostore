import 'dart:async';
import 'dart:convert';

import 'package:either_dart/either.dart';
import 'package:neostore/base/network_model/api_constant.dart';
import 'package:neostore/base/network_model/api_error.dart';
import 'package:neostore/base/network_model/api_handler.dart';
import 'package:neostore/data_source/remote/response/table_detail_response.dart';
import 'package:neostore/domain/model/table_detail.dart';

class TableDetailApiRequest {
  Future<Either<TableDetail, ApiError>> getTableDetailApi(int productId) async {
    var response = await APIHandler.get(
      url: "${APIs.tableDetail}?product_id=$productId",
    );

    if (response.statusCode == 200) {
      var tableDetailResponse = TableDetailResponse(jsonDecode(response.data));
      return Left(tableDetailResponse.getData().first.mapToDomain());
    } else {
      return Right(ApiError(message: response.statusMessage));
    }

    // if (response is ApiError) {
    //   completer.complete(response);
    //   return completer.future;
    // } else {
    //   completer.complete(response);
    //   return completer.future;
    // }
  }
}
