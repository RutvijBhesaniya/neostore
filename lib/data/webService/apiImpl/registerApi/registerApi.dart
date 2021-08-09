import 'package:neostore/data/model/RegisterRequest.dart';

abstract class RegisterApi {
  Future<dynamic> getRegisterApi(RegisterRequest registerRequest);
}
