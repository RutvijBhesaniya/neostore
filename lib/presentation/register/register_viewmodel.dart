import 'package:flutter/material.dart';
import 'package:neostore/data/api/entity/register_entity.dart';
import 'package:neostore/data/api/request/register_request.dart';
import 'package:neostore/domain/use_case/register_use_case.dart';

class RegisterProvider extends ChangeNotifier {
  RegisterUseCase _registerUseCase;

  RegisterProvider(this._registerUseCase);

  late RegisterEntity _registerEntity;

  get registerEntity => _registerEntity;

  bool _isLoading = true;

  get isLoading => _isLoading;

  bool checkValue = false;

  void changeCheckValue(bool value) {
    checkValue = value;
    notifyListeners();
  }

  ///register user method
  Future<dynamic> getRegisterUser(
      RegisterRequest registerRequest, BuildContext context) async {
    _isLoading = true;
    var response = await _registerUseCase.callApi(registerRequest, context);

    _isLoading = false;
    return response;
  }
}
