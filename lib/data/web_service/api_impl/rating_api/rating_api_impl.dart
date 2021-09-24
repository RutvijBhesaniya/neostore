import 'dart:async';
import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:neostore/base/network_model/api_constant.dart';
import 'package:neostore/base/network_model/api_error.dart';
import 'package:neostore/base/network_model/api_handler.dart';
import 'package:neostore/data/request/rating_api_request.dart';
import 'package:neostore/data/web_service/api_impl/rating_api/rating_api.dart';
import 'package:neostore/domain/model/rating.dart';

class RatingApiImpl extends RatingApi {
  final RatingApiRequest _ratingApiRequest;

  RatingApiImpl(this._ratingApiRequest);

  @override
  Future<Either<Rating,ApiError>> getRatingApi(int productid) {
    return _ratingApiRequest.getRatingApi(productid);
  }
}
