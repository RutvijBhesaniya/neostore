import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:neostore/base/network_model/api_constant.dart';
import 'package:neostore/base/network_model/api_error.dart';
import 'package:neostore/base/network_model/api_handler.dart';
import 'package:neostore/data/api/request/register_request.dart';
import 'package:neostore/data_source/remote/response/register_response.dart';
import 'package:neostore/domain/model/register.dart';

class RegisterApiRequest{
  Future<Either<Register,ApiError>> getRegisterApi(
      RegisterRequest registerRequest, BuildContext context) async {
    FormData formData = new FormData.fromMap(registerRequest.toJson());

    Response response = await APIHandler.post(
      url: "${APIs.register}",
      requestBody: formData,
    );
    if(response.statusCode == 200){
      var registerResponse =RegisterResponse(jsonDecode(response.data));
      return Left(registerResponse.getData().first.mapToDomain());
    }else{
      return Right(ApiError(message: response.statusMessage));
    }

  }
}