import 'dart:async';
import 'package:neostore/base/network_model/api_constant.dart';
import 'package:neostore/base/network_model/api_error.dart';
import 'package:neostore/base/network_model/api_handler.dart';
import 'package:neostore/utils/shared_preferences/memory_management.dart';

class CartApiRequest{
  Future getCartApi() async {
    Map<String, String> map = Map<String, String>();
    map.putIfAbsent("access_token", () => MemoryManagement.getAccessToken()!);

    Completer<dynamic> completer = new Completer<dynamic>();

    var response = await APIHandler.get(
      url: "${APIs.listCart}",
      additionalHeaders: map,
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