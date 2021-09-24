import 'package:either_dart/either.dart';
import 'package:neostore/base/base_use_case.dart';
import 'package:neostore/base/network_model/api_error.dart';
import 'package:neostore/domain/repository/my_order_list_repository/my_order_list_repository.dart';
import 'package:neostore/presentation/model/order_list_item.dart';

class MyOrderListUseCase extends BaseUseCase<dynamic> {
  MyOrderListRepository? _orderListRepository;

  MyOrderListUseCase(MyOrderListRepository orderListRepository) {
    this._orderListRepository = orderListRepository;
  }

  @override
  Future<Either<OrderListItem,ApiError>> callApi() {
    return _orderListRepository!.getOrderListRepository().then((value) {
      if (value.isLeft) {
        return Left(value.left.mapToPresentation());
      } else {
        return Right(value.right);
      }
    });
  }
}
