import 'package:either_dart/either.dart';
import 'package:neostore/base/base_use_case.dart';
import 'package:neostore/base/network_model/api_error.dart';
import 'package:neostore/domain/repository/login_repository/login_repository.dart';
import 'package:neostore/presentation/model/login_item.dart';

class LoginUseCase extends BaseUseCase<dynamic> {
  late LoginRepository _loginRepository;

  LoginUseCase(LoginRepository _loginRepository) {
    this._loginRepository = _loginRepository;
  }

  @override
  Future<Either<LoginItem, ApiError>> callApi([loginRequest, context]){
    return _loginRepository.getLoginRepository(loginRequest, context).then((value){
      if(value.isLeft) {
        return Left(value.left.mapToPresentation());
      } else {
        return Right(value.right);
      }
    });
  }
}
