import 'package:neostore/data/web_service/api_impl/rating_api/rating_api.dart';
import 'package:neostore/domain/repository/rating_repository/rating_repository.dart';

class RatingRepositoryImpl extends RatingRepository {
  late RatingApi _ratingApi;

  RatingRepositoryImpl(RatingApi _ratingApi) {
    this._ratingApi = _ratingApi;
  }

  @override
  Future getRatingRepository(int productid) {
    return _ratingApi.getRatingApi(productid);
  }
}
