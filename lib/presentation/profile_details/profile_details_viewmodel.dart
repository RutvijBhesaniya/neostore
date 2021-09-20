import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:neostore/data/api/entity/my_account_entity.dart';
import 'package:neostore/domain/use_case/my_account_use_case.dart';
import 'package:neostore/utils/shared_preferences/memory_management.dart';

class ProfileDetailsProvider extends ChangeNotifier {
  MyAccountUseCase _myAccountUseCase;

  ProfileDetailsProvider(this._myAccountUseCase);

  MyAccountEntity? _myAccountEntity;

  MyAccountEntity? get myAccountEntity => _myAccountEntity;

  bool _isLoading = true;

  get isLoading => _isLoading;


  ///my account detail method
  void getMyAccount() async {
    _isLoading = true;
    var response = await _myAccountUseCase.callApi();
    _myAccountEntity = MyAccountEntity.fromJson(jsonDecode(response));
    MemoryManagement.setFirstName(
        firstName: _myAccountEntity!.dataEntity!.userDataEntity!.firstName);
    MemoryManagement.setLastName(
        lastName: _myAccountEntity!.dataEntity!.userDataEntity!.lastName);
    MemoryManagement.setEmail(email: _myAccountEntity!.dataEntity!.userDataEntity!.email);
    MemoryManagement.setPhoneNumber(
        phoneNumber: _myAccountEntity!.dataEntity!.userDataEntity!.phoneNo);

    _isLoading = false;
    notifyListeners();
  }
}
