import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:neostore/base/network_model/api_constant.dart';
import 'package:neostore/base/network_model/api_error.dart';
import 'package:neostore/base/network_model/api_handler.dart';
import 'package:neostore/data/api/entity/login_entity.dart';
import 'package:neostore/data/api/request/login_request.dart';
import 'package:neostore/data_source/remote/response/login_response.dart';
import 'package:neostore/domain/model/login.dart';

class LoginApiRequest {
  Future<Either<Login, ApiError>> getLoginApi(
      LoginRequest loginRequest, BuildContext context) async {
    FormData formData = new FormData.fromMap(loginRequest.toJson());

    Response response = await APIHandler.post(
      url: "${APIs.login}",
      requestBody: formData,
    );
    if(response.statusCode == 200) {
      var loginResponse = LoginResponse(jsonDecode(response.data));
      return Left(loginResponse.getData().first.mapToDomain());
    } else {
      return Right(ApiError(message: response.statusMessage));
    }
  }
}
