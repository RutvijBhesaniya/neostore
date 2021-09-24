import 'dart:convert';
import 'dart:typed_data';

import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:neostore/base/network_model/api_constant.dart';
import 'package:neostore/base/network_model/api_error.dart';
import 'package:neostore/data_source/remote/response/edit_profile_response.dart';
import 'package:neostore/domain/model/edit_profile.dart';
import 'package:neostore/utils/shared_preferences/memory_management.dart';
import 'package:http/http.dart' as http;

class EditProfileApiRequest {
  Future<Either<EditProfile, ApiError>> getEditProfileApi(
      String email,
      String dob,
      String phoneNo,
      Uint8List profilePic,
      String firstName,
      String lastName) async {
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
    print("responseString=>${response.statusCode}");


    if (response.statusCode == 200) {
      var responseString = await response.stream.bytesToString();

      var editProfileResponse = EditProfileResponse(jsonDecode(responseString));

      return Left(editProfileResponse.getData().first.mapToDomain());
    } else {
      var responseString = await response.stream.bytesToString();

      var res = json.decode(responseString);
      return Right(ApiError(message: res['message']));
      // Center(
      //   child: CircularProgressIndicator(),
      // );
    }
  }
}
