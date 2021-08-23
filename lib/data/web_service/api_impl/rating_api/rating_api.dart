import 'package:neostore/data/model/request/rating_request.dart';
import 'package:neostore/data/model/response/rating_response.dart';

abstract class RatingApi {
  Future<dynamic> getRatingApi(int productid);
}
