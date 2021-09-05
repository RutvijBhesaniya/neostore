import 'dart:async';
import 'package:neostore/base/network_model/api_constant.dart';
import 'package:neostore/base/network_model/api_error.dart';
import 'package:neostore/base/network_model/api_handler.dart';
import 'package:neostore/data/web_service/api_impl/my_account_api/my_account_api.dart';
import 'package:neostore/utils/shared_preferences/memory_management.dart';

class MyAccountApiImpl implements MyAccountApi {
  @override
  Future getLoginApi() async {
    print('accesstoken=>${MemoryManagement.getAccessToken()}');
    Completer<dynamic> completer = new Completer<dynamic>();
    // FormData formData = new FormData.fromMap(loginRequest.toJson());
    Map<String,String> map = Map();
    map.putIfAbsent('access_token', () => MemoryManagement.getAccessToken()!);


    var response = await APIHandler.get(
      additionalHeaders:map,
      url: "${APIs.fetchAccountDetail
      }"

      // requestBody: MemoryManagement.getAccessToken(),
      // context: context,
    );
    print("urlmyaacount=>${APIs.fetchAccountDetail}");
    print('gotResponseinLoginApiImpl=>$response');
    if (response is ApiError) {
      completer.complete(response);
      return completer.future;
    } else {
      completer.complete(response);
      return completer.future;
    }
  }
}
