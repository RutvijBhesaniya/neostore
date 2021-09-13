import 'package:neostore/base/base_use_case.dart';
import 'package:neostore/data/web_service/repository/rating_repository/rating_repository.dart';

class RatingUseCase extends BaseUseCase<dynamic> {
  late RatingRepository _ratingRepository;

  RatingUseCase(RatingRepository ratingRepository) {
    this._ratingRepository = ratingRepository;
  }

  @override
  Future callApi([productid]) {
    return _ratingRepository.getRatingRepository(productid);
  }
}
