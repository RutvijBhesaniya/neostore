import 'package:neostore/data/web_service/api_impl/delete_cart_api/delete_cart_api.dart';
import 'package:neostore/data/web_service/repository/delete_cart_repository/delete_cart_repository.dart';

class DeleteCartRepositoryImpl implements DeleteCartRepository {
  late DeleteCartApi _deleteCartApi;

  DeleteCartRepositoryImpl(DeleteCartApi _deleteCartApi) {
    this._deleteCartApi = _deleteCartApi;
  }

  @override
  Future getDeleteCartRepository(String productId) {
    return _deleteCartApi.getDeleteCartApi(productId);
  }
}
