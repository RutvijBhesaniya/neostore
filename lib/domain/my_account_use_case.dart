import 'package:neostore/base/base_use_case.dart';
import 'package:neostore/data/web_service/repository/my_account_repository/my_account_repository.dart';

class MyAccountUseCase extends BaseUseCase{
  late MyAccountRepository _myAccountRepository;

  MyAccountUseCase(MyAccountRepository _myAccountRepository){
    this._myAccountRepository =_myAccountRepository;
  }

  @override
  Future callApi() {
    return _myAccountRepository.getMyAccountRepository();
  }
}