import 'package:neostore/data/web_service/api_impl/edit_cart_api/edit_cart_api.dart';
import 'package:neostore/data/web_service/repository/edit_cart_repository/edit_cart_repository.dart';

class EditCartRepositoryImpl implements EditCartRepository {
  late EditCartApi _editCartApi;

  EditCartRepositoryImpl(EditCartApi _editCartApi) {
    this._editCartApi = _editCartApi;
  }

  @override
  Future getEditCartRepository(String productId, String quantity) {
    return _editCartApi.getEditCartApi(productId, quantity);
  }
}
