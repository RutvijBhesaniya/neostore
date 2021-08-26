import 'package:neostore/base/Base_use_case.dart';
import 'package:neostore/data/web_service/repository/add_to_cart_repository/add_to_cart_repository.dart';

class AddToCartUseCase extends BaseUseCase<dynamic> {
   late AddToCartRepository _addToCartRepository;

  AddToCartUseCase(AddToCartRepository addToCartRepository) {
    this._addToCartRepository = _addToCartRepository;
  }

  @override
  Future callApi([productId, quantity]) {
    return _addToCartRepository.getAddToCartRepository(productId, quantity);
  }
}
