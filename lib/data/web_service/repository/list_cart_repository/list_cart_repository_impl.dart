
import 'package:neostore/data/web_service/api_impl/list_cart_api/list_cart_api.dart';
import 'package:neostore/data/web_service/repository/list_cart_repository/list_cart_repository.dart';

class ListCartRepositoryImpl implements ListCartRepository {
  late ListCartApi _listCartApi;

  ListCartRepositoryImpl(ListCartApi _listCartApi) {
    this._listCartApi = _listCartApi;
  }

  @override
  Future getListCartRepository() {
    return _listCartApi.getListCartApi();
  }
}
