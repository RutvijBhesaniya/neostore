import 'package:neostore/data/api/entity/reset_password_entity.dart';

class ResetPassword {
  int? status;
  String? message;
  String? userMsg;

  ResetPassword({this.status, this.message, this.userMsg});
}

extension ResetPasswordEntityExt on ResetPasswordEntity {
  ResetPassword mapToDomain() => ResetPassword(
        status: this.status,
        message: this.message,
        userMsg: this.userMsg,
      );
}

extension ResetPasswordEntityExtList on List<ResetPasswordEntity> {
  List<ResetPassword> mapToDomain() =>
      this.map((element) => element.mapToDomain()).toList();
}
