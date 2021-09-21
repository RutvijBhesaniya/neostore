import 'package:neostore/domain/model/forgot_password.dart';

class ForgotPasswordItem {
  int? status;
  String? message;
  String? userMsg;

  ForgotPasswordItem({this.status, this.message, this.userMsg});
}

extension ForgotPasswordExt on ForgotPassword {
  ForgotPasswordItem mapToPresentation() => ForgotPasswordItem(
        status: this.status,
        message: this.message,
        userMsg: this.userMsg,
      );
}

extension ForgotPasswordExtList on List<ForgotPassword> {
  List<ForgotPasswordItem> mapToPresentation() =>
      this.map((element) => element.mapToPresentation()).toList();
}
