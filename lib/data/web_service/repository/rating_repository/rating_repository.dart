import 'package:neostore/data/model/request/rating_request.dart';

abstract class RatingRepository{
  Future<dynamic> getRatingRepository(int productid);

}