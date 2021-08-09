import 'package:neostore/data/model/RegisterRequest.dart';

abstract class RegisterRepository {
  Future<dynamic> getRegisterRepository(RegisterRequest registerRequest);
}
