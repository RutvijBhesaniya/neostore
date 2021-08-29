import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:neostore/base/network_model/api_constant.dart';
import 'package:neostore/base/network_model/api_error.dart';
import 'package:neostore/base/network_model/api_handler.dart';
import 'package:neostore/data/model/request/edit_profile_request.dart';
import 'package:neostore/data/web_service/api_impl/edit_profile_api/edit_profile_api.dart';
import 'package:neostore/utils/shared_preferences/memory_management.dart';

class EditProfileApiImpl extends EditProfileApi {
  @override
  Future getEditProfileApi(
      EditProfileRequest editProfileRequest, BuildContext context) async {
    Map<String, String> map = Map<String, String>();

    map.putIfAbsent('access_token', () => MemoryManagement.getAccessToken()!);

    Completer<dynamic> completer = new Completer<dynamic>();
    FormData formData = new FormData.fromMap(map);

    var response = await APIHandler.post(
      url: "${APIs.updateProfile}",
      requestBody: formData,
      additionalHeaders: map
    );

    if (response is APIError) {
      completer.complete(response);
      return completer.future;
    } else {
      completer.complete(response);
      return completer.future;
    }
  }
}
