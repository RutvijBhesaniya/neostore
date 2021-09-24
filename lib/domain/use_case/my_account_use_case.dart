import 'package:either_dart/either.dart';
import 'package:neostore/base/base_use_case.dart';
import 'package:neostore/base/network_model/api_error.dart';
import 'package:neostore/domain/repository/my_account_repository/my_account_repository.dart';
import 'package:neostore/presentation/model/my_account_item.dart';

class MyAccountUseCase extends BaseUseCase {
  late MyAccountRepository _myAccountRepository;

  MyAccountUseCase(MyAccountRepository _myAccountRepository) {
    this._myAccountRepository = _myAccountRepository;
  }

  @override
  Future<Either<MyAccountItem, ApiError>> callApi() {
    return _myAccountRepository.getMyAccountRepository().then((value) {
      if (value.isLeft) {
        return Left(value.left.mapToPresentation());
      } else {
        return Right(value.right);
      }
    });
  }
}
