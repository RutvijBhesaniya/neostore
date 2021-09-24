import 'package:either_dart/either.dart';
import 'package:neostore/base/network_model/api_error.dart';
import 'package:neostore/domain/model/edit_cart.dart';

abstract class EditCartApi {
  Future<Either<EditCart,ApiError>> getEditCartApi(int productId, int quantity);
}

