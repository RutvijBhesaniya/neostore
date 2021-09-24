import 'dart:convert';
import 'package:either_dart/either.dart';
import 'package:flutter/cupertino.dart';
import 'package:neostore/base/network_model/api_error.dart';
import 'package:neostore/data/api/entity/my_account_entity.dart';
import 'package:neostore/domain/use_case/my_account_use_case.dart';
import 'package:neostore/presentation/model/my_account_item.dart';
import 'package:neostore/utils/shared_preferences/memory_management.dart';

class ProfileDetailsProvider extends ChangeNotifier {
  MyAccountUseCase _myAccountUseCase;

  ProfileDetailsProvider(this._myAccountUseCase);

  MyAccountItem? _myAccountItem;

  MyAccountItem? get myAccountItem => _myAccountItem;

  ApiError? _getMyAccountError;

  ApiError? get getMyAccountError => _getMyAccountError;

  bool _isLoading = true;

  get isLoading => _isLoading;

  ///my account detail method
  Future<void> getMyAccount() async {
    _isLoading = true;
    var response = await _myAccountUseCase.callApi();

    if (response.isLeft) {
      _myAccountItem = response.left;
      MemoryManagement.setFirstName(
          firstName: _myAccountItem?.dataItem?.userDataItem?.firstName);
      MemoryManagement.setLastName(
          lastName: _myAccountItem?.dataItem?.userDataItem?.lastName);
      MemoryManagement.setEmail(
          email: _myAccountItem?.dataItem?.userDataItem?.email);
      MemoryManagement.setPhoneNumber(
          phoneNumber: _myAccountItem?.dataItem?.userDataItem?.phoneNo);
      _isLoading = false;
    } else {
      _isLoading = false;
      _getMyAccountError = response.right;
    }
    notifyListeners();
  }
}
