import 'dart:async';
import 'package:neostore/base/network_model/api_constant.dart';
import 'package:neostore/base/network_model/api_error.dart';
import 'package:neostore/base/network_model/api_handler.dart';
import 'package:neostore/data/web_service/api_impl/table_category_api/table_category_api.dart';

class TableCategoryApiImpl implements TableCategoryApi {
  @override
  Future getTableCategoryApi(int categoryId) async {
    Completer<dynamic> completer = new Completer<dynamic>();
    // FormData formData = new FormData.fromMap(tableCategoryResponse.toJson());

    var response = await APIHandler.get(
      url: "${APIs.tableCategory}",
      requestBody: {
        "product_category_id" : categoryId
      },

      // context: context,
    );
    print('gotResponse=>${ response.runtimeType}');
    if (response is ApiError) {
      completer.complete(response);
      return completer.future;
    } else {
      completer.complete(response);
      return completer.future;
    }
  }
}
