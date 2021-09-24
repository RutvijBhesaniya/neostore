import 'package:either_dart/either.dart';
import 'package:neostore/base/base_use_case.dart';
import 'package:neostore/base/network_model/api_error.dart';
import 'package:neostore/domain/repository/add_to_cart_repository/add_to_cart_repository.dart';
import 'package:neostore/presentation/model/add_to_cart_item.dart';

class AddToCartUseCase extends BaseUseCase<dynamic> {
  late AddToCartRepository _addToCartRepository;

  AddToCartUseCase(AddToCartRepository addToCartRepository) {
    this._addToCartRepository = addToCartRepository;
  }

  @override
  Future<Either<AddToCartItem, ApiError>> callApi([productId, quantity]) {
    return _addToCartRepository
        .getAddToCartRepository(productId, quantity)
        .then((value) {
      if (value.isLeft) {
        return Left(value.left.mapToPresentation());
      } else {
        return Right(value.right);
      }
    });
  }
}
