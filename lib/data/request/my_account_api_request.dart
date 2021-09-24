import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:neostore/base/network_model/api_constant.dart';
import 'package:neostore/base/network_model/api_error.dart';
import 'package:neostore/base/network_model/api_handler.dart';
import 'package:neostore/data_source/remote/response/my_account_response.dart';
import 'package:neostore/domain/model/my_account.dart';
import 'package:neostore/utils/shared_preferences/memory_management.dart';

class MyAccountApiRequest {
  Future<Either<MyAccount, ApiError>> getLoginApi() async {
    // Completer<dynamic> completer = new Completer<dynamic>();
    Map<String, String> map = Map();
    map.putIfAbsent('access_token', () => MemoryManagement.getAccessToken()!);

    Response response = await APIHandler.get(
      additionalHeaders: map,
      url: "${APIs.fetchAccountDetail}",
    );
   if(response.statusCode == 200){
     var myAccountResponse = MyAccountResponse(jsonDecode(response.data));
     return Left(myAccountResponse.getData().first.mapToDomain());
   }else{
     return Right(ApiError(message: response.statusMessage));

   }
  }
}
