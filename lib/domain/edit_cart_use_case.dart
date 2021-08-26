import 'package:neostore/base/Base_use_case.dart';
import 'package:neostore/data/web_service/repository/edit_cart_repository/edit_cart_repository.dart';

class EditCartUseCase extends BaseUseCase {
  late EditCartRepository _editCartRepository;

  EditCartUseCase(EditCartRepository editCartRepository) {
    this._editCartRepository = _editCartRepository;
  }

  @override
  Future callApi([productId, quantity]) {
    return _editCartRepository.getEditCartRepository(productId, quantity);
  }
}
