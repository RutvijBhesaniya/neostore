import 'package:neostore/base/base_use_case.dart';
import 'package:neostore/data/web_service/repository/cart_repository/cart_repository.dart';

class CartUseCase extends BaseUseCase<dynamic> {
  late CartRepository _listCartRepository;

  CartUseCase(CartRepository listCartRepository) {
    this._listCartRepository = listCartRepository;
  }

  @override
  Future callApi() {
    return _listCartRepository.getCartRepository();
  }
}
