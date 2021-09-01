import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:neostore/base/network_model/api_constant.dart';
import 'package:neostore/base/network_model/api_error.dart';
import 'package:neostore/base/network_model/api_handler.dart';
import 'package:neostore/data/model/request/edit_profile_request.dart';
import 'package:neostore/data/web_service/api_impl/edit_profile_api/edit_profile_api.dart';
import 'package:neostore/utils/shared_preferences/memory_management.dart';
import 'package:http/http.dart' as http;

class EditProfileApiImpl extends EditProfileApi {
  @override
  Future getEditProfileApi(String email, String dob, String phoneNo,
      Uint8List profilePic, String firstName, String lastName) async {
    print("profilepic=>${profilePic}");
    Map<String, String> map = Map<String, String>();
    // Map<String, String> mapToken = Map<String, String>();
    map.putIfAbsent('email', () => email);
    map.putIfAbsent('dob', () => dob);
    map.putIfAbsent('phone_no', () => phoneNo);
    // map.putIfAbsent('profile_pic', () => profilePic);
    map.putIfAbsent('first_name', () => firstName);
    map.putIfAbsent('last_name', () => lastName);
    print('editmap=>${map}');

    // mapToken.putIfAbsent(
    //     'access_token', () => MemoryManagement.getAccessToken()!);

    // var request = http.MultipartRequest('POST', Uri.parse(APIs.updateProfile));
    // request.fields['email'] = email;
    // request.fields['dob'] = dob;
    // request.fields['phone_no'] = phoneNo;
    // request.fields['first_name'] = firstName;
    // request.fields['last_name'] = lastName;
    // request.files.add(http.MultipartFile.fromBytes(
    //   'profile_pic',
    //   profilePic,
    //   filename: "test",
    //
    //   // contentType: MediaType('application', 'octet-stream'),
    // ));
    // request.headers.addAll(mapToken);
    // var response = await request.send();
    // print(response.stream);
    // print(response.statusCode);
    // final res = await http.Response.fromStream(response);
    // print(res.body);
    // var responseJson = json.decode(res.body);
    // Completer<dynamic> completer = new Completer<dynamic>();
    // FormData formData = new FormData.fromMap(map);

    var headers = {'access_token': MemoryManagement.getAccessToken()!};
    var request = http.MultipartRequest(
        'POST',
        Uri.parse(
            APIs.updateProfile));
    print("editrequest=>${Uri.parse}");
    print("requeturrrrrrrrrr=>${request}");
    print('firstname=>${firstName}');
    print('lastName=>${lastName}');
    print('email=>${email}');
    print('dob=>${dob}');
    print('phoneNo=>${phoneNo}');
    request.fields.addAll(map);
    print("editmappppppppp=>${map}");
    // request.fields.addAll({
    //   'first_name': firstName,
    //   'last_name': lastName,
    //   'email': email,
    //   'dob': dob,
    //   'phone_no': phoneNo
    // });
    request.files
        .add(await http.MultipartFile.fromBytes('profile_pic', profilePic));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();



    if (response.statusCode == 200) {
      var responseString = await response.stream.bytesToString();
      print("editresponstrrrrrr=>${responseString}");
      return responseString;
    } else {
      Center(child: CircularProgressIndicator(),);
      print('reason=>${response.reasonPhrase}');
    }


    // var response = await APIHandler.post(
    //     url: "${APIs.updateProfile}",
    //     requestBody: formData,
    //     additionalHeaders: mapToken);

    // if (response is APIError) {
    //   completer.complete(response);
    //   return completer.future;
    // } else {
    //   completer.complete(response);
    //   return completer.future;
    // }
  }
}
