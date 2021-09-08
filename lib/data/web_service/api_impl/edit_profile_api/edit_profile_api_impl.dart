import 'dart:async';
import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:neostore/base/network_model/api_constant.dart';
import 'package:neostore/data/web_service/api_impl/edit_profile_api/edit_profile_api.dart';
import 'package:neostore/utils/shared_preferences/memory_management.dart';
import 'package:http/http.dart' as http;

class EditProfileApiImpl extends EditProfileApi {
  @override
  Future getEditProfileApi(String email, String dob, String phoneNo,
      Uint8List profilePic, String firstName, String lastName) async {
    var headers = {'access_token': MemoryManagement.getAccessToken()!};

    var request = http.MultipartRequest('POST', Uri.parse(APIs.updateProfile));
    request.fields['email'] = email;
    request.fields['dob'] = dob;
    request.fields['phone_no'] = phoneNo;
    request.fields['first_name'] = firstName;
    request.fields['last_name'] = lastName;
    request.files.add(http.MultipartFile.fromBytes(
      'profile_pic',
      profilePic,
      filename: "test",
    ));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var responseString = await response.stream.bytesToString();
      return responseString;
    } else {
      Center(
        child: CircularProgressIndicator(),
      );
    }
  }
}
