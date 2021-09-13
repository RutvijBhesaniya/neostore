import 'package:neostore/base/base_use_case.dart';
import 'package:neostore/data/web_service/repository/delete_cart_repository/delete_cart_repository.dart';

class DeleteCartUseCase extends BaseUseCase {
  late DeleteCartRepository _deleteCartRepository;

  DeleteCartUseCase(DeleteCartRepository deleteCartRepository) {
    this._deleteCartRepository = deleteCartRepository;
  }

  @override
  Future callApi([productId]) {
    return _deleteCartRepository.getDeleteCartRepository(productId);
  }
}
