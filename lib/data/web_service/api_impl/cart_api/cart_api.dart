import 'package:either_dart/either.dart';
import 'package:neostore/base/network_model/api_error.dart';
import 'package:neostore/domain/model/list_cart.dart';

abstract class CartApi {
  Future<Either<ListCart,ApiError>> getCartApi();
}
