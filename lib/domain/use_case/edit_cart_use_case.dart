import 'package:either_dart/either.dart';
import 'package:neostore/base/base_use_case.dart';
import 'package:neostore/base/network_model/api_error.dart';
import 'package:neostore/domain/repository/edit_cart_repository/edit_cart_repository.dart';
import 'package:neostore/presentation/model/edit_cart_item.dart';

class EditCartUseCase extends BaseUseCase<dynamic> {
  EditCartRepository? _editCartRepository;

  EditCartUseCase(EditCartRepository editCartRepository) {
    this._editCartRepository = editCartRepository;
  }

  @override
  Future<Either<EditCartItem,ApiError>> callApi([productId, quantity]) {
    return _editCartRepository!.getEditCartRepository(productId, quantity).then((value) {
      if (value.isLeft) {
        return Left(value.left.mapToPresentation());
      } else {
        return Right(value.right);
      }
    });
  }
}
