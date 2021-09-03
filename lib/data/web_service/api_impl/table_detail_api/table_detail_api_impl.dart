import 'dart:async';

import 'package:neostore/base/network_model/api_constant.dart';
import 'package:neostore/base/network_model/api_error.dart';
import 'package:neostore/base/network_model/api_handler.dart';
import 'package:neostore/data/web_service/api_impl/table_detail_api/table_detail_api.dart';

class TableDetailApiImpl extends TableDetailApi {
  @override
  Future getTableDetailApi(int productId) async {
    Completer<dynamic> completer = new Completer<dynamic>();
    // FormData formData = new FormData.fromMap(tableCategoryResponse.toJson());

    print("sssss=>${"${APIs.tableDetail}?product_id=$productId"}");
    var response = await APIHandler.get(
      url: "${APIs.tableDetail}?product_id=$productId",
      // requestBody: {"product_id ": productId},
      // context: context,
    );

    print('gotResponseee=>${response.runtimeType}');
    if (response is ApiError) {
      completer.complete(response);
      return completer.future;
    } else {
      completer.complete(response);
      return completer.future;
    }
  }
}
