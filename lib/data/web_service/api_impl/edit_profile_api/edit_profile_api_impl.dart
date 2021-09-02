import 'dart:async';
import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:neostore/base/network_model/api_constant.dart';
import 'package:neostore/data/web_service/api_impl/edit_profile_api/edit_profile_api.dart';
import 'package:neostore/utils/shared_preferences/memory_management.dart';
import 'package:http/http.dart' as http;

class EditProfileApiImpl extends EditProfileApi {
  @override
  Future getEditProfileApi(String email, String dob, String phoneNo,
      Uint8List profilePic, String firstName, String lastName) async {
    Map<String, String> map = Map<String, String>();
    map.putIfAbsent('email', () => email);
    map.putIfAbsent('dob', () => dob);
    map.putIfAbsent('phone_no', () => phoneNo);
    map.putIfAbsent('first_name', () => firstName);
    map.putIfAbsent('last_name', () => lastName);

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
    print("editrequest=>$Uri.parse");
    print("requeturrrrrrrrrr=>$request");
    print('firstname=>$firstName');
    print('lastName=>$lastName');
    print('email=>$email');
    print('dob=>$dob');
    print('phoneNo=>$phoneNo');
    request.fields.addAll(map);
    print("editmappppppppp=>$map");
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



    // void compressImage() async {
    //   File imageFile = await ImagePicker.pickImage();
    //   final tempDir = await getTemporaryDirectory();
    //   final path = tempDir.path;
    //   int rand = new Math.Random().nextInt(10000);
    //
    //   Im.Image image = Im.decodeImage(imageFile.readAsBytesSync());
    //   Im.Image smallerImage = Im.copyResize(image, 500); // choose the size here, it will maintain aspect ratio
    //
    //   var compressedImage = new File(imageFile)..writeAsBytesSync(Im.encodeJpg(image, quality: 85));
    // }



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
