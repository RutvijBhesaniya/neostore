import 'package:either_dart/either.dart';
import 'package:neostore/base/base_use_case.dart';
import 'package:neostore/base/network_model/api_error.dart';
import 'package:neostore/domain/repository/delete_cart_repository/delete_cart_repository.dart';
import 'package:neostore/presentation/model/delete_cart_item.dart';

class DeleteCartUseCase extends BaseUseCase {
  late DeleteCartRepository _deleteCartRepository;

  DeleteCartUseCase(DeleteCartRepository deleteCartRepository) {
    this._deleteCartRepository = deleteCartRepository;
  }

  @override
  Future<Either<DeleteCartItem, ApiError>> callApi([productId]) {
    return _deleteCartRepository
        .getDeleteCartRepository(productId)
        .then((value) {
      if (value.isLeft) {
        return Left(value.left.mapToPresentation());
      } else {
        return Right(value.right);
      }
    });
  }
}
