import 'package:flutter/cupertino.dart';
import 'package:neostore/data/model/response/reset_password_response.dart';
import 'package:neostore/domain/reset_password_use_case.dart';

class ResetPasswordProvider extends ChangeNotifier {
  ResetPasswordUseCase _resetPasswordUseCase;

  ResetPasswordProvider(this._resetPasswordUseCase);

  ResetPasswordResponse? _resetPasswordResponse;

  ResetPasswordResponse? get resetPasswordResponse => _resetPasswordResponse;



  bool _isLoading = true;

  get isLoading => _isLoading;

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
