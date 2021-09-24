import 'package:either_dart/either.dart';
import 'package:neostore/base/network_model/api_error.dart';
import 'package:neostore/domain/model/delete_cart.dart';

abstract class DeleteCartRepository {
  Future<Either<DeleteCart, ApiError>> getDeleteCartRepository(int productId);
}
