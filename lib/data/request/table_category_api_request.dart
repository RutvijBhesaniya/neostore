import 'dart:async';

import 'package:neostore/base/network_model/api_constant.dart';
import 'package:neostore/base/network_model/api_error.dart';
import 'package:neostore/base/network_model/api_handler.dart';

class TableCategoryApiRequest{
  Future getTableCategoryApi(int categoryId) async {
    Completer<dynamic> completer = new Completer<dynamic>();

    var response = await APIHandler.get(
      url: "${APIs.tableCategory}",
      requestBody: {"product_category_id": categoryId},
    );
    if (response is ApiError) {
      completer.complete(response);
      return completer.future;
    } else {
      completer.complete(response);
      return completer.future;
    }
  }

}