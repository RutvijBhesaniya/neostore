import 'package:either_dart/either.dart';
import 'package:neostore/base/network_model/api_error.dart';
import 'package:neostore/domain/model/rating.dart';

abstract class RatingRepository{
  Future<Either<Rating,ApiError>> getRatingRepository(int productid);

}