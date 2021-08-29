import 'package:neostore/base/Base_use_case.dart';
import 'package:neostore/data/web_service/repository/list_cart_repository/list_cart_repository.dart';

class ListCartUseCase extends BaseUseCase<dynamic> {
  late ListCartRepository _listCartRepository;

  ListCartUseCase(ListCartRepository listCartRepository) {
    this._listCartRepository = listCartRepository;
  }

  @override
  Future callApi() {
    return _listCartRepository.getListCartRepository();
  }
}
