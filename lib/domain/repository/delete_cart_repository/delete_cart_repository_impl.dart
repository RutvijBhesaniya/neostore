import 'package:either_dart/either.dart';
import 'package:neostore/base/network_model/api_error.dart';
import 'package:neostore/data/web_service/api_impl/delete_cart_api/delete_cart_api.dart';
import 'package:neostore/domain/model/delete_cart.dart';
import 'package:neostore/domain/repository/delete_cart_repository/delete_cart_repository.dart';

class DeleteCartRepositoryImpl implements DeleteCartRepository {
  late DeleteCartApi _deleteCartApi;

  DeleteCartRepositoryImpl(DeleteCartApi _deleteCartApi) {
    this._deleteCartApi = _deleteCartApi;
  }

  @override
  Future<Either<DeleteCart, ApiError>> getDeleteCartRepository(int productId) {
    return _deleteCartApi.getDeleteCartApi(productId);
  }
}
