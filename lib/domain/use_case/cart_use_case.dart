import 'package:either_dart/either.dart';
import 'package:neostore/base/base_use_case.dart';
import 'package:neostore/base/network_model/api_error.dart';
import 'package:neostore/domain/repository/cart_repository/cart_repository.dart';
import 'package:neostore/presentation/model/list_cart_item.dart';

class CartUseCase extends BaseUseCase<dynamic> {
  late CartRepository _listCartRepository;

  CartUseCase(CartRepository listCartRepository) {
    this._listCartRepository = listCartRepository;
  }

  @override
  Future<Either<ListCartItem, ApiError>> callApi() {
    return _listCartRepository.getCartRepository().then((value) {
      if (value.isLeft) {
        return Left(value.left.mapToPresentation());
      } else {
        return Right(value.right);
      }
    });
  }
}
