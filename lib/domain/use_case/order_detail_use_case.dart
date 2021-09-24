import 'package:either_dart/either.dart';
import 'package:neostore/base/base_use_case.dart';
import 'package:neostore/base/network_model/api_error.dart';
import 'package:neostore/domain/repository/order_detail_repository/order_detail_repository.dart';
import 'package:neostore/presentation/model/order_detail_item.dart';

class OrderDetailUseCase extends BaseUseCase<dynamic> {
  late OrderDetailRepository _orderDetailRepository;

  OrderDetailUseCase(OrderDetailRepository orderDetailRepository) {
    this._orderDetailRepository = orderDetailRepository;
  }

  @override
  Future<Either<OrderDetailItem, ApiError>> callApi([orderId]) {
    return _orderDetailRepository
        .getOrderDetailRepository(orderId)
        .then((value) {
      if (value.isLeft) {
        return Left(value.left.mapToPresentation());
      } else {
        return Right(value.right);
      }
    });
  }
}
