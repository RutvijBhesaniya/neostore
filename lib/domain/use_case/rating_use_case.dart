import 'package:either_dart/either.dart';
import 'package:neostore/base/base_use_case.dart';
import 'package:neostore/base/network_model/api_error.dart';
import 'package:neostore/domain/repository/rating_repository/rating_repository.dart';
import 'package:neostore/presentation/model/rating_item.dart';

class RatingUseCase extends BaseUseCase<dynamic> {
  late RatingRepository _ratingRepository;

  RatingUseCase(RatingRepository ratingRepository) {
    this._ratingRepository = ratingRepository;
  }

  @override
  Future<Either<RatingItem, ApiError>> callApi([productid]) {
    return _ratingRepository.getRatingRepository(productid).then((value) {
      if (value.isLeft) {
        return Left(value.left.mapToPresentation());
      } else {
        return Right(value.right);
      }
    });
  }
}
