import 'package:neostore/domain/model/reset_password.dart';

class ResetPasswordItem {
  int? status;
  String? message;
  String? userMsg;

  ResetPasswordItem({this.status, this.message, this.userMsg});
}

extension ResetPasswordExt on ResetPassword {
  ResetPasswordItem mapToPresentation() => ResetPasswordItem(
        status: this.status,
        message: this.message,
        userMsg: this.userMsg,
      );
}

extension ResetPasswordExtList on List<ResetPassword> {
  List<ResetPasswordItem> mapToPresentation() =>
      this.map((element) => element.mapToPresentation()).toList();
}
