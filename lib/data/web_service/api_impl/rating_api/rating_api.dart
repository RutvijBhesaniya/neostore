import 'package:either_dart/either.dart';
import 'package:neostore/base/network_model/api_error.dart';
import 'package:neostore/domain/model/rating.dart';

abstract class RatingApi {
  Future<Either<Rating,ApiError>> getRatingApi(int productid);
}