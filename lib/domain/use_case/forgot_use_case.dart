import 'package:either_dart/either.dart';
import 'package:neostore/base/base_use_case.dart';
import 'package:neostore/base/network_model/api_error.dart';
import 'package:neostore/domain/repository/forgot_repository/forgot_repository.dart';
import 'package:neostore/presentation/model/forgot_password_item.dart';

class ForgotUseCase extends BaseUseCase<dynamic> {
  late ForgotPasswordRepository _forgotPasswordRepository;

  ForgotUseCase(ForgotPasswordRepository forgotPasswordRepository) {
    this._forgotPasswordRepository = forgotPasswordRepository;
  }

  @override
  Future<Either<ForgotPasswordItem, ApiError>> callApi([email]) {
    return _forgotPasswordRepository
        .getForgotPasswordRepository(email)
        .then((value) {
      if (value.isLeft) {
        return Left(value.left.mapToPresentation());
      } else {
        return Right(value.right);
      }
    });
  }
}
