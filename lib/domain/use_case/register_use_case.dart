import 'package:either_dart/either.dart';
import 'package:neostore/base/base_use_case.dart';
import 'package:neostore/base/network_model/api_error.dart';
import 'package:neostore/domain/repository/register_repository/register_repository.dart';
import 'package:neostore/presentation/model/register_item.dart';

class RegisterUseCase extends BaseUseCase<dynamic> {
  late RegisterRepository _registerRepository;

  RegisterUseCase(RegisterRepository _registerRepository) {
    this._registerRepository = _registerRepository;
  }

  @override
  Future<Either<RegisterItem, ApiError>> callApi([registerRequest, context]) {
    return _registerRepository
        .getRegisterRepository(registerRequest, context)
        .then((value) {
      if (value.isLeft) {
        return Left(value.left.mapToPresentation());
      } else {
        return Right(value.right);
      }
    });
  }
}
