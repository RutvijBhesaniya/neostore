import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:neostore/base/network_model/api_error.dart';
import 'package:neostore/data/api/entity/register_entity.dart';
import 'package:neostore/data/api/request/register_request.dart';
import 'package:neostore/domain/use_case/register_use_case.dart';
import 'package:neostore/presentation/model/register_item.dart';
import 'package:neostore/presentation/register/register_view.dart';

class RegisterProvider extends ChangeNotifier {
  RegisterUseCase _registerUseCase;

  RegisterProvider(this._registerUseCase);

  // late RegisterEntity _registerEntity;
  //
  // get registerEntity => _registerEntity;

  bool _isLoading = true;

  get isLoading => _isLoading;

  bool checkValue = false;

  void changeCheckValue(bool value) {
    checkValue = value;
    notifyListeners();
  }

  GenderTypes? _value;

  GenderTypes? get currentValue => _value;

  void changeGender(GenderTypes genderTypes) {
    _value = genderTypes;
    notifyListeners();
  }


  ///register user method
  Future<Either<RegisterItem, ApiError>> getRegisterUser(
      RegisterRequest registerRequest, BuildContext context) async {
    _isLoading = true;
    var response = await _registerUseCase.callApi(registerRequest, context);

    if (response.isLeft) {
      RegisterItem _registerItem = response.left;
      _isLoading = false;
      return Left(_registerItem);
    } else {
      _isLoading = false;
      return Right(response.right);
    }
  }
}
