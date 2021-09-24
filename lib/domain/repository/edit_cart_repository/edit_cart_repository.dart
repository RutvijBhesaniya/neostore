import 'package:either_dart/either.dart';
import 'package:neostore/base/network_model/api_error.dart';
import 'package:neostore/domain/model/edit_cart.dart';

abstract class EditCartRepository {
  Future<Either<EditCart,ApiError>> getEditCartRepository(int productId, int quantity);
}
