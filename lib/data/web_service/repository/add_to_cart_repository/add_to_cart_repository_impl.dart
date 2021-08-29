import 'package:neostore/data/web_service/api_impl/add_to_cart_api/add_to_cart_api.dart';
import 'package:neostore/data/web_service/repository/add_to_cart_repository/add_to_cart_repository.dart';

class AddToCartRepositoryImpl implements AddToCartRepository {
  late AddToCartApi _addToCartApi;

  AddToCartRepositoryImpl(AddToCartApi _addToCartApi) {
    this._addToCartApi = _addToCartApi;
  }

  @override
  Future getAddToCartRepository(int productId, int quantity) {
    print("got product category id: " + productId.toString());

    return _addToCartApi.getAddToCartApi(productId, quantity);
  }
}
