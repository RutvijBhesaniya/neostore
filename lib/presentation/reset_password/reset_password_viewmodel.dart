import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:neostore/data/model/response/reset_password_response.dart';
import 'package:neostore/data/web_service/api_impl/reset_password_api/reset_password_api_impl.dart';
import 'package:neostore/data/web_service/repository/reset_password_repository/reset_password_repository.dart';
import 'package:neostore/domain/reset_password_use_case.dart';

class ResetPasswordProvider extends ChangeNotifier {
  ResetPasswordResponse? _resetPasswordResponse;

  ResetPasswordResponse? get resetPasswordResponse => _resetPasswordResponse;

  ResetPasswordUseCase _resetPasswordUseCase =
      ResetPasswordUseCase(ResetPasswordRepositoryImpl(ResetPasswordApiImpl()));

  bool _isLoading = true;

  get isLoading => _isLoading;

  Future<dynamic> getResetPassword(
      String oldPassword, String password, String confirmPassword) async {
    _isLoading = true;
    var response = await _resetPasswordUseCase.callApi(
        oldPassword, password, confirmPassword);

    print("resetPasswordResponse=>$response");
    _isLoading = false;
    notifyListeners();
    return response;
  }
}
