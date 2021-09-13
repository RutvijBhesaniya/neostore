
import 'package:neostore/data/web_service/api_impl/cart_api/cart_api.dart';
import 'package:neostore/domain/repository/cart_repository/cart_repository.dart';

class CartRepositoryImpl implements CartRepository {
  late CartApi _cartApi;

  CartRepositoryImpl(CartApi _cartApi) {
    this._cartApi = _cartApi;
  }

  @override
  Future getCartRepository() {
    return _cartApi.getCartApi();
  }
}
