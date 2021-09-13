import 'package:neostore/base/base_use_case.dart';
import 'package:neostore/data/web_service/repository/register_repository/register_repository.dart';

class RegisterUseCase extends BaseUseCase<dynamic> {
  late RegisterRepository _registerRepository;

  RegisterUseCase(RegisterRepository _registerRepository) {
    this._registerRepository = _registerRepository;
  }

  @override
  Future callApi([registerRequest, context]) {
    return _registerRepository.getRegisterRepository(registerRequest, context);
  }
}
