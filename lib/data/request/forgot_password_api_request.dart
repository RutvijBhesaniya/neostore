import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:neostore/base/network_model/api_constant.dart';
import 'package:neostore/base/network_model/api_error.dart';
import 'package:neostore/base/network_model/api_handler.dart';
import 'package:neostore/data_source/remote/response/forgot_response.dart';
import 'package:neostore/domain/model/forgot_password.dart';

class ForgotPasswordApiRequest {
  Future<Either<ForgotPassword, ApiError>> getForgotPasswordApi(
      String email) async {
    Map<String, dynamic> map = Map<String, dynamic>();
    map.putIfAbsent("email", () => email);
    FormData formData = new FormData.fromMap(map);

    Response response = await APIHandler.post(
      url: "${APIs.forgot}",
      requestBody: formData,
    );
    print('gotforgetpassword response=>${response.statusMessage}');
    print('gotforgetpassword response=>${response.statusCode}');
    if (response.statusCode == 200) {
      var forgotResponse = ForgotPasswordResponse(jsonDecode(response.data));
      return Left(forgotResponse.getData().first.mapToDomain());
    }else{
      var res = json.decode(response.data);
      return Right(ApiError(message: res['message']));
    }
  }
}
