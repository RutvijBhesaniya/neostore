import 'package:either_dart/either.dart';
import 'package:neostore/base/network_model/api_error.dart';
import 'package:neostore/domain/model/add_to_cart.dart';

abstract class AddToCartRepository {
  Future<Either<AddToCart, ApiError>> getAddToCartRepository(int productId, int quantity);
}
