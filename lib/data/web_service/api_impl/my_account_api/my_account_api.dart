
import 'package:either_dart/either.dart';
import 'package:neostore/base/network_model/api_error.dart';
import 'package:neostore/domain/model/my_account.dart';

abstract class MyAccountApi {
  Future<Either<MyAccount, ApiError>> getLoginApi();
}
