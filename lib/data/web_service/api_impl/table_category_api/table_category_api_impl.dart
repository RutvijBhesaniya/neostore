import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:neostore/base/network_model/api_constant.dart';
import 'package:neostore/base/network_model/api_error.dart';
import 'package:neostore/base/network_model/api_handler.dart';
import 'package:neostore/data/model/response/table_category_response.dart';
import 'package:neostore/data/web_service/api_impl/table_category_api/table_category_api.dart';

class TableCategory implements TableCategoryApi {
  @override
  Future getTableCategoryApi(
      TableCategoryResponse tableCategoryResponse, BuildContext context) async {
    Completer<dynamic> completer = new Completer<dynamic>();
    FormData formData = new FormData.fromMap(tableCategoryResponse.toJson());

    var response = await APIHandler.post(
      url: "${APIs.tableCategory}",
      requestBody: formData,
      context: context,
    );
    print('gotResponse=>${await response}');
    if (response is APIError) {
      completer.complete(response);
      return completer.future;
    } else {
      completer.complete(response);
      return completer.future;
    }
  }
}