import 'dart:async';

import 'package:neostore/base/network_model/api_constant.dart';
import 'package:neostore/base/network_model/api_error.dart';
import 'package:neostore/base/network_model/api_handler.dart';

class TableDetailApiRequest{
  Future getTableDetailApi(int productId) async {
    Completer<dynamic> completer = new Completer<dynamic>();

    var response = await APIHandler.get(
      url: "${APIs.tableDetail}?product_id=$productId",
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