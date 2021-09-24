import 'package:either_dart/either.dart';
import 'package:neostore/base/network_model/api_error.dart';
import 'package:neostore/domain/model/my_account.dart';
import 'package:neostore/presentation/model/my_account_item.dart';

abstract class MyAccountRepository {
  Future<Either<MyAccount, ApiError>> getMyAccountRepository();
}
