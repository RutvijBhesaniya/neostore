import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:neostore/base/network_model/api_constant.dart';
import 'package:neostore/base/network_model/api_error.dart';
import 'package:neostore/base/network_model/api_handler.dart';
import 'package:neostore/data_source/remote/response/rating_response.dart';
import 'package:neostore/domain/model/rating.dart';

class RatingApiRequest {
  Future<Either<Rating, ApiError>> getRatingApi(int productid) async {
    Map<String, dynamic> map = Map<String, dynamic>();
    map.putIfAbsent("product_id", () => productid);
    FormData formData = new FormData.fromMap(map);

    Response response =
        await APIHandler.post(url: "${APIs.ratingBar}", requestBody: formData);

    if (response.statusCode == 200) {
      var ratingResponse = RatingResponse(jsonDecode(response.data));
      return Left(ratingResponse.getData().first.mapToDomain());
    } else {
      return Right(ApiError(message: response.statusMessage));
    }
  }
}
