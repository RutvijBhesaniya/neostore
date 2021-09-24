import 'package:flutter/cupertino.dart';
import 'package:neostore/data/api/entity/reset_password_entity.dart';
import 'package:neostore/domain/use_case/reset_password_use_case.dart';

class ResetPasswordProvider extends ChangeNotifier {
  ResetPasswordUseCase _resetPasswordUseCase;

  ResetPasswordProvider(this._resetPasswordUseCase);

  ResetPasswordEntity? _resetPasswordEntity;

  ResetPasswordEntity? get resetPasswordEntity => _resetPasswordEntity;

  bool _isLoading = true;

  get isLoading => _isLoading;

  ///reset password method
  Future<dynamic> getResetPassword(
      String oldPassword, String password, String confirmPassword) async {
    _isLoading = true;
    var response = await _resetPasswordUseCase.callApi(
        oldPassword, password, confirmPassword);

    _isLoading = false;
    notifyListeners();
    return response;
  }
}
