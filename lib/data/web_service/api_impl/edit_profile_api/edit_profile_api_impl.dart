import 'dart:async';
import 'package:dio/dio.dart';
import 'package:neostore/base/network_model/api_constant.dart';
import 'package:neostore/base/network_model/api_error.dart';
import 'package:neostore/base/network_model/api_handler.dart';
import 'package:neostore/data/web_service/api_impl/edit_profile_api/edit_profile_api.dart';
import 'package:neostore/utils/shared_preferences/memory_management.dart';

class EditProfileApiImpl extends EditProfileApi {
  @override
  Future getEditProfileApi(
      String email, String dob, String phoneNumber, String profilePic) async {
    Map<String, dynamic> map = Map<String, dynamic>();
    map.putIfAbsent("email", () => email);
    map.putIfAbsent("dob", () => dob);
    map.putIfAbsent("phone_no", () => phoneNumber);
    map.putIfAbsent("profile_pic", () => profilePic);
    map.putIfAbsent('access_token', () => MemoryManagement.getAccessToken());

    Completer<dynamic> completer = new Completer<dynamic>();
    FormData formData = new FormData.fromMap(map);

    var response = await APIHandler.post(
        url: "${APIs.updateProfile}", requestBody: formData);

    if (response is APIError) {
      completer.complete(response);
      return completer.future;
    } else {
      completer.complete(response);
      return completer.future;
    }
  }
}
