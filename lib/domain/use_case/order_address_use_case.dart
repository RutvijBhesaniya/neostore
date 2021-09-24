import 'package:either_dart/either.dart';
import 'package:neostore/base/base_use_case.dart';
import 'package:neostore/base/network_model/api_error.dart';
import 'package:neostore/domain/model/order_address.dart';
import 'package:neostore/domain/repository/order_address_repository/order_address_repository.dart';
import 'package:neostore/presentation/model/order_address_item.dart';

class OrderAddressUseCase extends BaseUseCase<dynamic> {
  late OrderAddressRepository _orderAddressRepository;

  OrderAddressUseCase(OrderAddressRepository orderAddressRepository) {
    this._orderAddressRepository = orderAddressRepository;
  }

  @override
  Future<Either<OrderAddressItem, ApiError>> callApi([address]) {
    return _orderAddressRepository.getOrderAddressRepository(
        address).then((value) {
      if (value.isLeft) {
        return Left(value.left.mapToPresentation());
      } else {
        return Right(value.right);
      }
    });
  }
}
