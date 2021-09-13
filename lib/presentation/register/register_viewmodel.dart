
import 'package:flutter/material.dart';
import 'package:neostore/data/model/request/register_request.dart';
import 'package:neostore/data/model/response/register_response.dart';
import 'package:neostore/domain/register_use_case.dart';

class RegisterProvider extends ChangeNotifier {

  RegisterUseCase _registerUseCase;
  RegisterProvider(this._registerUseCase);

  late RegisterResponse _registerResponse;


  get registerResponse => _registerResponse;

  bool _isLoading = true;

  get isLoading => _isLoading;

  bool checkValue = false;

  void changeCheckValue(bool value){
    checkValue = value;
    notifyListeners();
  }

  Future<dynamic> getRegisterUser(
      RegisterRequest registerRequest, BuildContext context) async {
    _isLoading = true;
    var response = await _registerUseCase.callApi(registerRequest, context);


    _isLoading = false;
    return response;
  }
}


