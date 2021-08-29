import 'dart:async';

import 'package:neostore/base/network_model/api_constant.dart';
import 'package:neostore/base/network_model/api_error.dart';
import 'package:neostore/base/network_model/api_handler.dart';
import 'package:neostore/data/web_service/api_impl/list_cart_api/list_cart_api.dart';
import 'package:neostore/utils/shared_preferences/memory_management.dart';

class ListCartApiImpl extends ListCartApi {
  @override
  Future getListCartApi() async {
    Map<String, String> map = Map<String, String>();
    map.putIfAbsent("access_token", () => MemoryManagement.getAccessToken()!);

    Completer<dynamic> completer = new Completer<dynamic>();

    var response =
        await APIHandler.get(url: "${APIs.listCart}", additionalHeaders: map
            // requestBody: formData
            );
    print('gotlistcart response=>$response');
    if (response is APIError) {
      completer.complete(response);
      return completer.future;
    } else {
      completer.complete(response);
      return completer.future;
    }
  }
}
