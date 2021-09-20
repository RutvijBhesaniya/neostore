import 'package:neostore/data/api/entity/forgot_password_entity.dart';

class ForgotPassword {
  int? status;
  String? message;
  String? userMsg;

  ForgotPassword({this.status, this.message, this.userMsg});
}

extension ForgotPasswordEntityExt on ForgotPasswordEntity {
  ForgotPassword mapToDomain() => ForgotPassword(
        status: this.status,
        message: this.message,
        userMsg: this.userMsg,
      );
}

extension ForgotPaswordEntityExtList on List<ForgotPasswordEntity> {
  List<ForgotPassword> mapToDomain() =>
      map((element) => element.mapToDomain()).toList();
}
